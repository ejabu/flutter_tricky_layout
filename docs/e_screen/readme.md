# Problems
## 1. Dropdown needs available options to be selected

We can see at `items` parameter, `DropdownButton` will get its 
options definition

``` dart
DropdownButton<UserModel>(
  items: snapshot.data // <-- this define options
      .map((user) => DropdownMenuItem<UserModel>(
            child: Text(user.name),
            value: user,
          ))
      .toList(),
  onChanged: (UserModel value) {
    setState(() {
      _currentUser = value;
    });
  },
  value: _currentUser,
);
```

## 2. Dropdown will re-init multiple times if wrapped in FutureBuilder

The problem occurs after we pick one options. Dropdown will modify _currentUser in StatefulWidget and execute `setState`.

**By triggering `setState`, by default, Flutter widget will trigger `build` method once more.**


``` dart
FutureBuilder<List<UserModel>>(
  future: db.getUserModelData(),
  builder: (BuildContext context, AsyncSnapshot snapshot) {
    if (!snapshot.hasData) return CircularProgressIndicator();
    return DropdownButton<UserModel>(
      items: snapshot.data
          .map((user) => DropdownMenuItem<UserModel>(
                child: Text(user.name),
                value: user,
              ))
          .toList(),
      onChanged: (UserModel value) {
        setState(() {
          _currentUser = value; // <-- Will trigger re-build on StatefulWidget
        });
      },
      value: _currentUser,
    );
}),
```



[![Error][1]][1]



----------


# Solution
## 1. Solution : Initialize options once in initState

It will be mandatory for us, **not to initialize inside build method**. As we need remove FutureBuilder, we also need to initialize screenStage


```dart

@override
void initState() {
  _screenStage = "loading"; // <-- set "loading" to display CircularProgress
  onceSetupDropdown();
  super.initState();
}

void onceSetupDropdown() async {
  _userSelection = await db.getUserModelData();
  _screenStage = "loaded"; // <-- set "loaded" to display DropdownButton
  setState(() {}); // <-- trigger flutter to re-execute "build" method
}
```

## 2. Then we can render properly based on screenStage value

It will be mandatory for us, **not to initialize inside build method**.
Therefore, we can remove FutureBuilder


```dart
_screenStage == "loaded"
  ? DropdownButton<UserModel>(  // <-- rendered at second "build"
      items: _userSelection
          .map((user) => DropdownMenuItem<UserModel>(
                child: Text(user.name),
                value: user,
              ))
          .toList(),
      onChanged: onChange,
      isExpanded: true,
      value: _currentUser,
      hint: Text('Select User'),
    )
  : CircularProgressIndicator(), // <-- rendered at first "build"
```

**Result**


[![Success][2]][2]

----------

## Fully working code

You can check it in this [Github Repo](https://github.com/ejabu/flutter_tricky_layout/blob/master/lib/e_screen/dropdown_sql_init.dart)

  [1]: https://i.stack.imgur.com/Wa12N.gif



  [2]: https://i.stack.imgur.com/zGyJg.gif
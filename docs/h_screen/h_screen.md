
## 1. Add fit FlexFit.tight parameter

we simply add fit parameter` FlexFit.tight` because by default, flexible will set
fit as `FlexFit.loose`.


``` dart
child: Column(
  children: <Widget>[
    Flexible(
      flex: 1,
      fit: FlexFit.tight, // add this line
      child: _adher(),
    ),
    Flexible(
      flex: 2,
      fit: FlexFit.tight, // add this line
      child: DrugsListView(),
    ),
  ],
),
```

## 2. Demo

[![Demo][1]][1]


  [1]: https://i.stack.imgur.com/TMj6B.gif


## 3. For full Repo

You may look into this repo and build it locally. [Github](https://github.com/ejabu/flutter_tricky_layout/blob/master/lib/h_screen/float_bottom_bar.dart) 
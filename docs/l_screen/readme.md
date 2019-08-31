## 1. Use Expanded to Move Image to the right

``` dart
Row(
  children: [
    Expanded( // Wrap Second Row with Expanded
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column( ..
          Column( ..
          // Column( .. Move out Last Column that contains Second Image
          ),
        ],
      ),
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(0.0),
          child: Image.asset(
            "assets/images/flower-2.jpeg",
            width: 50,
            height: 50,
          ),
        ),
      ],
    )
  ],
),
```

[![Result][1]][1]

Therefore, currently we have new two section. **Left and Right**.

To put, `2km` beside second image, we can **focus** modifying on **Right Section**

## 2. Replace Column with Row to add more content in right section

Previoulsy we have this :

``` dart
Column(
  mainAxisAlignment: MainAxisAlignment.end,
  children: <Widget>[
    ClipRRect(
      borderRadius: BorderRadius.circular(0.0),
      child: Image.asset(
        "assets/images/flower-2.jpeg",
        width: 50,
        height: 50,
      ),
    ),
  ],
)
```

Modify into these lines :

``` dart
Row( // change Column to Row
  crossAxisAlignment: CrossAxisAlignment.start, // will place 2km on TOP
  children: <Widget>[
    Text("2km"),
    ClipRRect(
      borderRadius: BorderRadius.circular(0.0),
      child: Image.asset(
        "assets/images/flower-2.jpeg",
        width: 50,
        height: 50,
      ),
    ),
  ],
),
```


[![Result][2]][2]

## Fully working code

You can check it in this [Github Repo](https://github.com/ejabu/flutter_tricky_layout/blob/master/lib/l_screen/list_view_two_image.dart)


  [1]: https://i.stack.imgur.com/jP54G.png



  [2]: https://i.stack.imgur.com/qOjnj.png


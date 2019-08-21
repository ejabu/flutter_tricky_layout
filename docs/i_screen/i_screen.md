

## 1. Problems

* I want to make a infinit height column (because of expanded widget) scrollable, but a `SingleChildScrollView` does not do the job.

* it does not crash, but if the height is set to the screen height I cannot scroll and I dont want to set a specific height (dont know the page hight + dont want emtpy space)


* If I add a pageview inside the column console returns: RenderViewport does not support returning intrinsic dimensions



## 2. Demo

[![Google Search Result][1]][1]

  [1]: https://i.stack.imgur.com/3IAd0.gif

## 3. Replace SingleChildScrollView


rather than :

``` dart
child: SingleChildScrollView(  // need to be replaced
  child: new Column(
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      header,
      new Expanded(
        child: pageView,
      )
    ],
  )
)
```

write this : 

``` dart
child: CustomScrollView( // replace by this
  slivers: <Widget>[
    header(context),
    pageView(context),
  ],
),
```

## 4. Rather than Wrap Expanded, Wrap with SliverList and SizedBox

> I dont want to set a specific height

Then having SizedBox is mandatory. As the screen must be scrollable, each of its **component** must have fixed height. 

This enables app to render multiple another PageView or Header.

Note : wrapping contents by SliverList **produces** scrollable Screen both horizontally and vertically

``` dart
Widget pageView(BuildContext context) {
  final section = SliverList(
    delegate: SliverChildListDelegate(
      [
        SizedBox(
          height: 100,
          child: PageView(
            children: <Widget>[
              AddTextInput(),
              AddNoteSettings(),
            ],
          ),
        ),
      ],
    ),
  );
  return section;
}

Widget headerContent(BuildContext context) {
  final section = SliverList(
    delegate: SliverChildListDelegate(
      [
        NewsFeed(),
      ],
    ),
  );
  return section;
}
```
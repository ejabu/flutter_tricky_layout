## We can achieve that by

1. Swap lastPage Widget to next position of current page
2. Animate to next page
3. Jump to real lastPage index
4. Refresh swapped Index to its previous value

-----

In this example, I used fixed **PageView children count, which is 8.**

### Demo

[![Demo][1]][1]


  [1]: https://i.stack.imgur.com/JjmCB.gif


### Comparison

1. **Combine to 8th page Button**

as CopsOnRoad suggested, this button will trigger **Scroll animation** to last page (in this case 8th page). Firstly, we
jumpToPage(6), and then animateToPage(7, ..).

This method works, **but adversely, user will notice sudden change of current page to 7th page**.

2. **Flash Jump to 8th page Button**

Unlike like first method, this button will avoid displaying 7th page unnecessarily 

### Syntax Explanation

**this is the main function**

```dart
void flashToEight() async {
  int pageCurrent = pageController.page.round();
  int pageTarget = 7;
  if (pageCurrent == pageTarget){
    return;
  }
  swapChildren(pageCurrent, pageTarget); // Step # 1
  await quickJump(pageCurrent, pageTarget); // Step # 2 and # 3
  WidgetsBinding.instance.addPostFrameCallback(refreshChildren); // Step # 4
}
```

**detailed look**

```dart
// Step # 1
void swapChildren(int pageCurrent, int pageTarget) {
  List<Widget> newVisiblePageViews = [];
  newVisiblePageViews.addAll(pageViews);

  if (pageTarget > pageCurrent) {
    newVisiblePageViews[pageCurrent + 1] = visiblePageViews[pageTarget];
  } else if (pageTarget < pageCurrent) {
    newVisiblePageViews[pageCurrent - 1] = visiblePageViews[pageTarget];
  }

  setState(() {
    visiblePageViews = newVisiblePageViews;
  });
}

// Step # 2 and # 3
Future quickJump(int pageCurrent, int pageTarget) async {
  int quickJumpTarget;

  if (pageTarget > pageCurrent) {
    quickJumpTarget = pageCurrent + 1;
  } else if (pageTarget < pageCurrent) {
    quickJumpTarget = pageCurrent - 1;
  }
  await pageController.animateToPage(
    quickJumpTarget,
    curve: Curves.easeIn,
    duration: Duration(seconds: 1),
  );
  pageController.jumpToPage(pageTarget);
}

// Step # 4
List<Widget> createPageContents() {
    return <Widget>[
      PageContent(1),
      PageContent(2),
      PageContent(3),
      PageContent(4),
      PageContent(5),
      PageContent(6),
      PageContent(7),
      PageContent(8),
    ];
  }

void refreshChildren(Duration duration) {
  setState(() {
    visiblePageViews = createPageContents();
  });
}
```

## Full Working-Example Repository

You may look into full source code and build locally. [Github](https://github.com/ejabu/flutter_tricky_layout/blob/master/lib/h_screen/jump_page_view.dart)

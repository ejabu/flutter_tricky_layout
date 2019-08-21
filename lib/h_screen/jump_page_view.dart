import 'package:flutter/material.dart';

class JumpPageView extends StatefulWidget {
  @override
  _JumpPageViewState createState() => _JumpPageViewState();
}

class _JumpPageViewState extends State<JumpPageView> {
  List<Widget> pageViews;
  List<Widget> visiblePageViews;
  PageController pageController;


  void animateToOne() {
    pageController.animateToPage(
      0,
      curve: Curves.easeIn,
      duration: Duration(seconds: 1),
    );
  }

  void jumpAnimateEight() async {
    pageController.jumpToPage(6);
    await pageController.animateToPage(
      7,
      curve: Curves.easeIn,
      duration: Duration(seconds: 1),
    );
  }

  void refreshChildren(Duration duration) {
    setState(() {
      visiblePageViews = createPageContents();
    });
  }

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

  void flashToEight() async {
    int pageCurrent = pageController.page.round();
    int pageTarget = 7;
    if (pageCurrent == pageTarget){
      return;
    }
    swapChildren(pageCurrent, pageTarget);
    await quickJump(pageCurrent, pageTarget);
    WidgetsBinding.instance.addPostFrameCallback(refreshChildren);
  }

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

  @override
  void initState() {
    pageController = PageController();
    pageViews = createPageContents();
    visiblePageViews = createPageContents();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Widget header() {
    return Container(
      height: 40,
      color: Colors.white30,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              RaisedButton.icon(
                label: Text('Animate to 1st page'),
                icon: Icon(Icons.chevron_left),
                onPressed: animateToOne,
              ),
              RaisedButton.icon(
                label: Text('Combine to 8th page'),
                icon: Icon(Icons.chevron_right),
                onPressed: jumpAnimateEight,
              ),
              RaisedButton.icon(
                label: Text('Flash Jump to 8th page'),
                icon: Icon(Icons.chevron_right),
                onPressed: flashToEight,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget pageView() {
    return PageView(
      controller: pageController,
      children: <Widget>[
        ...visiblePageViews,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page View Jump'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: header(),
            ),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: pageView(),
            ),
          ],
        ),
      ),
    );
  }
}

class PageContent extends StatelessWidget {
  final int pageIndex;

  PageContent(this.pageIndex);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white30,
        border: Border.all(
          color: Colors.black26,
          width: 1.0,
        ),
      ),
      child: Center(
        child: Text(
          "Page #$pageIndex",
          textScaleFactor: 3,
        ),
      ),
    );
  }
}

class AddNoteSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(child: Text("AddNoteSettings")),
    );
  }
}

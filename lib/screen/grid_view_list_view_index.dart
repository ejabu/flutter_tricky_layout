import 'package:flutter/material.dart';

class GridViewListViewIndex extends StatelessWidget {

  final int newsFeedCount = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Special after 6th'),
      ),
      body: Container(
        child: renderScrollArea(context),
      ),
    );
  }

  List<Widget> businessLogic(BuildContext context) {
    List<Widget> temp = [];
    for (var i = 1; i < newsFeedCount+1; i++) {
      if (i % 6 == 1) {
        temp.add(renderGrids(context));
      }
      if (i % 6 == 0) {
        temp.add(renderLists(context));
      }
    }
    return temp;
  }

  Widget renderScrollArea(BuildContext context) {
    final scrollableArea = CustomScrollView(
      slivers: businessLogic(context),

      // Below lines are neglected as we have more complex requirement
      // slivers: <Widget>[
      //   renderGrids(context),
      //   renderLists(context),
      //   renderGrids(context),
      //   renderLists(context),
      // ],
    );
    return scrollableArea;
  }

  Widget renderLists(BuildContext context) {
    final lists = SliverList(
      delegate: SliverChildListDelegate(
        [
          NewsFeed(),
        ],
      ),
    );
    return lists;
  }

  Widget renderGrids(BuildContext context) {
    final grids = SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      delegate: SliverChildListDelegate(
        [
          NewsFeed(),
          NewsFeed(),
          NewsFeed(),
          NewsFeed(),
          NewsFeed(),
          NewsFeed(),
        ],
      ),
    );
    return grids;
  }
}

class NewsFeed extends StatelessWidget {
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
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: Text("Content"),
      ),
    );
  }
}

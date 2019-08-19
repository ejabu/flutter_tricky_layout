// Reference :
// https://medium.com/flutterpub/flutter-listview-gridview-inside-scrollview-68b722ae89d4

import 'package:flutter/material.dart';

class GridViewListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid View List View'),
      ),
      body: Container(
        child: renderScrollArea(context),
      ),
    );
  }

  // Rather than commonly used SingleChildScrollView which has one child
  // We must used this CustomScrollView which has children (called slivers)
  // See youtube video : https://www.youtube.com/watch?v=ORiTTaVY6mM&t=26


  // Use this :

  //   final scrollableArea = CustomScrollView(
  //     slivers: <Widget>[
  //       renderGrids(context),
  //       renderLists(context),
  //       renderGrids(context),
  //       renderLists(context),
  //     ],
  //   );
  //

  // Not this :

  //   final scrollableArea = SingleChildScrollView(
  //     child: <Widget>[ // unable to make it as children
  //       renderGrids(context),
  //       renderLists(context),
  //       renderGrids(context),
  //       renderLists(context),
  //     ],
  //   );

  // What widget can be placed inside slivers ?
  // Only two : Grids, or Lists
  // But, we named it SliverGrid and SliverLists

  // See youtube video : https://youtu.be/ORiTTaVY6mM?t=31

  Widget renderScrollArea(BuildContext context) {
    final scrollableArea = CustomScrollView(
      slivers: <Widget>[
        renderGrids(context),
        renderLists(context),
        renderGrids(context),
        renderLists(context),
      ],
    );
    return scrollableArea;
  }

  Widget renderLists(BuildContext context) {
    final lists = SliverList(
      delegate: SliverChildListDelegate(
        [
          NewsFeed(),
          NewsFeed(),
          NewsFeed(),
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

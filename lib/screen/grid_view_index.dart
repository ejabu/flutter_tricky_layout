import 'package:flutter/material.dart';

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
      child: Center(
        child: Text("Content"),
      ),
    );
  }
}

class GridViewIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid View Index'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: renderGrids(context),
      ),
    );
  }

  Widget renderSeparator() {
    return Center(
      child: Text("This is Separator"),
    );
  }

  Widget renderGrids(BuildContext context) {
    Widget grids = GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        if ((index + 1) % 6 == 0) {
          return renderSeparator();
        }
        return NewsFeed();
      },
    );
    return grids;
  }
}

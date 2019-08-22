import 'package:flutter/material.dart';

class StaticSideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: StaticDrawer(),
                ),
                Expanded(
                  child: PageView(
                    children: <Widget>[
                      MainContent(1),
                      MainContent(2),
                      MainContent(3),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  final int indexContent;

  MainContent(this.indexContent);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Content # $indexContent'),
      ),
      color: Colors.black26,
    );
  }
}

class StaticDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(title: Text("Menu A"), dense: true),
        ListTile(title: Text("Menu B"), dense: true),
        ListTile(title: Text("Menu C"), dense: true),
        ListTile(title: Text("Menu D"), dense: true),
        ListTile(title: Text("Menu E"), dense: true),
        ListTile(title: Text("Menu F"), dense: true),
        ListTile(title: Text("Menu G"), dense: true),
        ListTile(title: Text("Menu H"), dense: true),
        ListTile(title: Text("Menu I"), dense: true),
        ListTile(title: Text("Menu J"), dense: true),
        ListTile(title: Text("Menu K"), dense: true),
        ListTile(title: Text("Menu L"), dense: true),
        ListTile(title: Text("Menu M"), dense: true),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class FloatBottomBarScreen extends StatelessWidget {
  Widget _adher() {
    return Container(
      color: Colors.deepPurple,
      child: Center(
        child: Text("Some Header ..", style: TextStyle(color: Colors.white)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: _adher(),
            ),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: DrugsListView(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class DrugsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        for (var i = 1; i < 21; i++)
          ListTile(
            leading: Icon(Icons.location_on, color: Colors.purple),
            title: Text("HISTOP"),
            subtitle: Text("Take $i Tablet \u00a9 Sunday 7.00 AM"),
          ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import 'screen/grid_view_index.dart';
import 'screen/grid_view_list_view.dart';
import 'screen/grid_view_list_view_index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BaseScreen(),
    );
  }
}

class BaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tricky Layouts'),
      ),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: <Widget>[
                  Dividers(),
                  ScreenButton(
                    title: "A-1. Grid View Index",
                    child: GridViewIndex(),
                  ),
                  Dividers(),
                  ScreenButton(
                    title: "A-2. Grid View + List View",
                    child: GridViewListView(),
                  ),
                  Dividers(),
                  ScreenButton(
                    title: "A-3. Grid View List View Index",
                    subtitle: "Special after 6th grid box",
                    child: GridViewListViewIndex(),
                  ),
                  Dividers(),
                  SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ScreenButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;

  const ScreenButton({
    this.title,
    this.subtitle,
    this.child,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("$title"),
      subtitle: subtitle != null ? Text("$subtitle") : null,
      trailing: Icon(Icons.chevron_right),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) {
              return child;
            },
          ),
        );
      },
    );
  }
}

class Dividers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(color: Colors.black54,);
  }
}

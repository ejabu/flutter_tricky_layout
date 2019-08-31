import 'package:flutter/material.dart';

class PopupDynamic extends StatefulWidget {
  @override
  _PopupDynamicState createState() => _PopupDynamicState();
}

class _PopupDynamicState extends State<PopupDynamic> {
  Widget _simplePopup() {
    return PopupMenuButton<int>(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Text("First"),
        ),
        PopupMenuItem(
          value: 2,
          child: Text("Second"),
        ),
      ],
    );
  }

  Widget _dynamicPopup() {
    // return Text("As");
    return PopupMenuButton<int>(itemBuilder: (context) {
      return [
        PopupMenuItem(
          enabled: false,
          height: 260,
          child: Center(child: CircularProgressIndicator()),
        ),
      ];
    });
  }

  Widget _dynamicPopup2() {
    return PopupMenuButton<int>(
      itemBuilder: (context) => [
        PopupMenuItem(
          enabled: false,
          height: 260,
          child: Center(child: CircularProgressIndicator()),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('On Progress'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            _simplePopup(),
            Text('Simple Popup\n'),
            _dynamicPopup(),
            Text('Dynamic Popup'),
          ],
        ),
      ),
    );
  }
}

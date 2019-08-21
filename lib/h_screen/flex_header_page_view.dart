import 'package:flutter/material.dart';

class FlexHeaderPageView extends StatelessWidget {
  Widget header() {
    return Container(
      height: 40,
      color: Colors.deepPurple,
      child: Center(
        child: Text("Some Header ..", style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget pageView() {
    return PageView(
      children: <Widget>[
        AddTextInput(),
        AddNoteSettings(),
      ],
      // physics: NeverScrollableScrollPhysics(),
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

class AddTextInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(child: Text("AddTextInput")),
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

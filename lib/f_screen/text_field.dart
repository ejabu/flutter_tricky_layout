import 'package:flutter/material.dart';
import 'dart:core';

class TextFieldScreen extends StatefulWidget {
  @override
  _TextFieldScreenState createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  TextEditingController _textEditingController = TextEditingController();

  GlobalKey _keyTextField = GlobalKey();

  void handleButton() {
    int maxLength = getMaxLength();
    print("maxLength : $maxLength");
  }

  int getMaxLength() {
    String properties = _keyTextField.currentWidget.toString();
    RegExp exp = new RegExp(r'(maxLength: )\d+');
    RegExpMatch matches = exp.firstMatch(properties);
    if (matches != null && matches.groupCount > 0) {
      String maxLengthStrings = matches.group(0);
      return int.parse(maxLengthStrings.split("maxLength: ").last);
    } else {
      print("Not found");
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Screen')),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              "Some Random Field",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: TextField(
              key: _keyTextField,
              controller: _textEditingController,
              autofocus: true,
              maxLength: 6,
            ),
          ),
          RaisedButton.icon(
            label: Text('Check'),
            icon: Icon(Icons.call),
            onPressed: handleButton,
          ),
        ],
      ),
    );
  }
}

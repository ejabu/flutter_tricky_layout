import 'package:flutter/material.dart';

class TextFieldValidateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Screen')),
      body: Column(
        children: <Widget>[
          ListTile(
            title: TextFormField(
              decoration: InputDecoration(labelText:"Full Name"),
              autovalidate: true,
              validator: (String value) {
                if (value.length < 3)
                  return 'Name must be more than 2 character';
                else
                  return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}

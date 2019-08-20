import 'package:flutter/material.dart';

class IntrinsicWidthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Intrinsic Width Usage")),
      body: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.red,
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 100.0, // we can play here
                // maxWidth: 100.0, // we can play here
              ),
              child: Container(
                color: Colors.purple,
                child: IntrinsicWidth(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        color: Colors.cyan,
                        child: Icon(Icons.title),
                      ),
                      Expanded(
                        child: Container(
                            color: Colors.yellow,
                            alignment: Alignment.center,
                            child: Icon(Icons.theaters)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

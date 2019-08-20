import 'package:flutter/material.dart';

class AnimatedContainerApp extends StatefulWidget {
  @override
  _AnimatedContainerAppState createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  bool isSmall = true;
  double _width = 50;
  double _height = 50;

  void changeSize() {
    // Toggle State
    if (isSmall) {
      setState(() {
        _width = 100;
        _height = 100;
        isSmall = false;
      });
    } else {
      setState(() {
        _width = 50;
        _height = 50;
        isSmall = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moving Box'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_to_home_screen),
            onPressed: changeSize,
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: FractionalOffset(1, 0),
            child: AnimatedContainer( // Changed to AnimatedContainer
              duration: Duration(seconds: 1), // Add Duration
              width: _width,
              height: _height,
              color: Color(0xffe5ee22),
            ),
          ),
        ],
      ),
    );
  }
}

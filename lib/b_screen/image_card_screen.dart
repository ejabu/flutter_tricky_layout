import 'package:flutter/material.dart';

class ImageCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Cards Basic"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                child: Image.asset("assets/images/flower-1.jpeg"),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Image.asset("assets/images/flower-2.jpeg"),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Image.asset("assets/images/flower-3.jpeg"),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Image.asset("assets/images/flower-4.jpeg"),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Image.asset("assets/images/flower-5.jpeg"),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Image.asset("assets/images/flower-6.jpeg"),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Image.asset("assets/images/flower-7.jpeg"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

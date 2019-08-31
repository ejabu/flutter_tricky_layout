import 'package:flutter/material.dart';

class WillPopScreen extends StatelessWidget {
  Future<void> saveCounter() async {
    await Future.delayed(Duration(seconds: 2));
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.setInt('startNumber', _steps);
  }

  Future<bool> onCloseEvent() async {
    await saveCounter();
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onCloseEvent,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Will Pop Interrupt'),
        ),
        body: Center(
          child: Text("Execute method when Closing"),
        ),
      ),
    );
  }
}

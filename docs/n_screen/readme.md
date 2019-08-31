
* we can wrap `Scaffold` using `WillPopScope`
* we can **execute** *saveCounter* inside the function
* ensure it will return **true** that wrapped inside `Future.value()`



``` dart
class WillPopScreen extends StatelessWidget {
  Future<void> saveCounter() async {
    final prefs = await SharedPreferences.getInstance(); // we can save state
    await prefs.setInt('startNumber', _steps);
  }

  Future<bool> onCloseEvent() async {
    await saveCounter();
    return Future.value(true); // we cannot put "return true"
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onCloseEvent, // will interrupt our scaffold dismissal
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

```
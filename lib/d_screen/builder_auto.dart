import 'package:flutter/material.dart';

class BuilderAuto extends StatefulWidget {
  @override
  _BuilderAutoState createState() => _BuilderAutoState();
}

class _BuilderAutoState extends State<BuilderAuto>
    with SingleTickerProviderStateMixin {

  AnimationController controller;

  @override
  void initState() {
    super.initState();
    setupAnimation();
  }

  void setupAnimation() {
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animation = Tween<double>(begin: 0, end: 1).animate(controller);
    return Scaffold(
      appBar: AppBar(
        title: Text('Auto Triggered'),
      ),
      body: AnimatedBuilder(
        animation: animation,
        child: Text("Moving Object"),
        builder: (BuildContext context, Widget child) {
          final xPos = 100 * animation.value;
          final yPos = 60 * animation.value;
          return Transform.translate(
            offset: Offset(xPos, yPos),
            child: child,
          );
        },
      ),
    );
  }
}

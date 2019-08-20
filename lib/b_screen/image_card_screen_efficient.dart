import 'package:flutter/material.dart';

List<String> imagePaths = [
  "assets/images/flower-1.jpeg",
  "assets/images/flower-2.jpeg",
  "assets/images/flower-3.jpeg",
  "assets/images/flower-4.jpeg",
  "assets/images/flower-5.jpeg",
];

class ImageCardScreenEfficient extends StatelessWidget {
  List<Widget> renderImages() {
    var temp = <Widget>[];
    for (var imagePath in imagePaths) {
      // add some conditional logic here
      if (imagePath.contains('3') || imagePath.contains('5')) {
        temp.add(ImageCard(
          imagePath: imagePath,
        ));
      }
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Cards Efficient"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: renderImages(),
          ),
        ),
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final String imagePath;

  ImageCard({this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Image.asset(imagePath),
    );
  }
}

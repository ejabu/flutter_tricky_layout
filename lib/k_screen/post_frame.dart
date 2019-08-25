import 'package:flutter/material.dart';

class PostFrameScreen extends StatefulWidget {
  @override
  _PostFrameScreenState createState() => _PostFrameScreenState();
}

class _PostFrameScreenState extends State<PostFrameScreen> {
  String barcode;
  void firstChange() async {
    try {
      // String barcodeRaw = await BarcodeScanner.scan();
      String barcodeRaw =
          await Future.delayed(Duration(seconds: 2)).then((val) {
        return "A #1";
      });
      setState(() => barcode = barcodeRaw);

      WidgetsBinding.instance
          .addPostFrameCallback(secondChange); // bind Callback

      print(barcode);
    } catch (e) {
      print("error");
    }
  }

  void secondChange(Duration duration) async {
    try {
      // String barcodeRaw = barcode;
      String barcodeRaw =
          await Future.delayed(Duration(seconds: 2)).then((val) {
        return "B #2";
      });

      setState(() => barcode = barcodeRaw);

      WidgetsBinding.instance
          .addPostFrameCallback(thirdChange); // bind Callback

      print(barcode);
    } catch (e) {
      print("error");
    }
  }

  void thirdChange(Duration duration) async {
    try {
      
      // Response response =
      //     await http.get('https://www.datakick.org/api/items/' + barcodeRaw);
      // Map<String, dynamic> barcodeJson = jsonDecode(response.body);
      // String barcodeNew = "${barcodeJson['brand_name']}";

      String barcodeNew =
          await Future.delayed(Duration(seconds: 2)).then((val) {
        return "C #3";
      });
      setState(() => barcode = barcodeNew);
      print(barcode);
    } catch (e) {
      print("error");
    }
  }

  @override
  void initState() {
    firstChange();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Frame - Demo'),
      ),
      body: Center(
        child: Text(
          "$barcode",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 120),
        child: Text(
          "Wait for 2 seconds between each call of API ",
          style: TextStyle(),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

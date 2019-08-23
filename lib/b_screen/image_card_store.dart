import 'package:flutter/material.dart';

class Stores {
  String storeName;
  String storeImage;
  String storeDeliveryTime;
  String deliveryCharges;
  List<String> storePageImage;
  List<String> storePageItemName;
  List<double> storePageItemPrice;

  Stores.list({
    this.storeName,
    this.storeDeliveryTime,
    this.storeImage,
    this.deliveryCharges,
    this.storePageImage,
    this.storePageItemName,
    this.storePageItemPrice,
  });
}

Stores newStore1 = Stores.list(
  storeName: "STORE 1",
  storeImage: "assets/images/STORE1FRONT",
  storeDeliveryTime: "25 min",
  deliveryCharges: "£2.90",
  storePageImage: [
    "assets/images/flower-3.jpeg",
    "assets/images/flower-4.jpeg",
  ],
  storePageItemName: ["Apple", "Mango"],
  storePageItemPrice: [100, 200],
);

Stores newStore2 = Stores.list(
  storeName: "STORE 2",
  storeImage: "assets/images/STORE2FRONT",
  storeDeliveryTime: "25 min",
  deliveryCharges: "£2.90",
  storePageImage: [
    "assets/images/flower-1.jpeg",
    "assets/images/flower-2.jpeg",
  ],
  storePageItemName: ["Apple", "Mango"],
  storePageItemPrice: [100, 200],
);

List<Stores> storesList = [
  newStore1,
  newStore2,
];

Stores selectedStore = storesList[0];

class ImageCardStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var widget = selectedStore;
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                for (var currentImage in widget.storePageImage)
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, top: 7.0),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            currentImage,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

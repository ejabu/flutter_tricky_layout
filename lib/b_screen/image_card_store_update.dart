import 'package:flutter/material.dart';

class Stores {
  String storeName;
  String storeImage;
  String storeDeliveryTime;
  String deliveryCharges;
  List<String> storePageImage;
  List<String> storePageItemName;
  List<String> storePageItemPrice;

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
  storePageItemPrice: ["100", "200"],
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
  storePageItemPrice: ["100", "200"],
);

List<Stores> storesList = [
  newStore1,
  newStore2,
];


class RestaurantPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurant"),
      ),
      body: Container(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 1000),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: storesList.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (context) => new StoresPage(
                            storeName: storesList[index].storeName,
                            storeDeliveryTime:
                                storesList[index].storeDeliveryTime,
                            deliveryCharges: storesList[index].deliveryCharges,
                            storePageImage: storesList[index].storePageImage,
                            storePageItemName:
                                storesList[index].storePageItemName,
                            storePageItemPrice:
                                storesList[index].storePageItemPrice,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 205,
                            width: 380,
                            child: Image(
                              image: AssetImage(storesList[index].storeImage),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(storesList[index].storeName),
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.update, size: 20.0),
                                    Text(storesList[index].storeDeliveryTime),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class StoresPage extends StatelessWidget {
  final String storeName;
  final String storeDeliveryTime;
  final String deliveryCharges;
  final List<String> storePageImage;
  final List<String> storePageItemName;
  final List<String> storePageItemPrice;

  StoresPage({
    this.storeName,
    this.storeDeliveryTime,
    this.deliveryCharges,
    this.storePageImage,
    this.storePageItemName,
    this.storePageItemPrice,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Restauran Menus")),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                for (var storeImage in storePageImage)
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, top: 7.0),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(storeImage),
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

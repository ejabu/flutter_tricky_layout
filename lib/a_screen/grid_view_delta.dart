import 'package:flutter/material.dart';

class GridViewDelta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Column homeThumb(String icon, String label) {
      Color color = Theme.of(context).primaryColor;

      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(8.0),
            child: Image.asset(icon, width: 32.0, height: 32.0),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget homeIcon = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
              margin: const EdgeInsets.only(
                  top: 40.0, left: 8.0, right: 8.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  homeThumb("assets/images/flower-1.jpeg", 'Claim Offers'),
                  homeThumb("assets/images/flower-1.jpeg", 'Wallet'),
                  homeThumb("assets/images/flower-1.jpeg", 'Redeem Offers'),
                ],
              )),
          Container(
              margin: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  homeThumb("assets/images/flower-1.jpeg", 'Account'),
                  homeThumb("assets/images/flower-1.jpeg", 'Merchants'),
                  homeThumb("assets/images/flower-1.jpeg", 'Shopping History'),
                ],
              )),
          Container(
            margin: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                homeThumb("assets/images/flower-1.jpeg", 'Notifications'),
                homeThumb("assets/images/flower-1.jpeg", 'Service Request'),
                homeThumb("assets/images/flower-1.jpeg", 'Share & Earn'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget grid = GridView.count(
      crossAxisCount: 4,
      children: List<Widget>.generate(
        16,
        (index) {
          return GridTile(
            child: Card(
              color: Colors.blue.shade200,
              child: Center(
                child: Text('tile $index'),
              ),
            ),
          );
        },
      ),
    );

    return MaterialApp(
      title: 'Minkville',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Minkville'),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                Image.asset(
                  'assets/images/flower-1.jpeg',
                  width: 600.0,
                  height: 180.0,
                  fit: BoxFit.fill,
                ),
                homeIcon,
                // grid
              ]),
            ),
            SliverGrid.count(
              children: <Widget>[grid],
              crossAxisCount: 1,
            ),
            
          ],
        ),
      ),
    );
  }
}

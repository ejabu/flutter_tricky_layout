import 'package:flutter/material.dart';

class ListViewComplex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen'),
      ),
      body: complexListView(),
    );
  }

  Widget complexListTile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text("Pay on: Wed, May 08 2019"),
        Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Icon(Icons.play_arrow),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Social Security"),
                    Text("Weekly | Debit"),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text("\$45.00"),
                Text("Not Received"),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget complexListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (BuildContext context, int position) {
        return ListTile(
          title: complexListTile(),
          onTap: () {
            debugPrint("ListTile Tapped");
          },
        );
      },
    );
  }

  Widget simpleListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (BuildContext context, int position) {
        return Column(children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Icon(Icons.play_arrow),
            ),
            title: Text(
              'Social Security',
            ),
            subtitle: Text('Weekly | Amex(Debit)'),
            trailing: Text('\$45.00'),
            onTap: () {
              debugPrint("ListTile Tapped");
            },
          )
        ]);
      },
    );
  }
}

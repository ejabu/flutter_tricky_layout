import 'package:flutter/material.dart';

class FormView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen'),
      ),
      body: SingleChildScrollView( // to handle overflow when keyboard pop
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                new Expanded(
                  child: ListTile(
                    dense: true,
                    title: Text(
                      "Property Name",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Enter the property name',
                      ),
                    ),
                    isThreeLine: true,
                  ),
                ),
                new Expanded(
                  child: ListTile(
                    dense: true,
                    title: Text(
                      "Contact Name",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: DropdownButton<int>(
                      items: [
                        DropdownMenuItem<int>(
                          value: 1,
                          child: Text(
                            "John Smith",
                          ),
                        ),
                        DropdownMenuItem<int>(
                          value: 2,
                          child: Text(
                            "Jon Doe",
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        // setState(() {
                        //   _value = value;
                        // });
                      },
                      // value: _value,
                      hint: Text(
                        "Select Contact Name",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    isThreeLine: true,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                new Expanded(
                  child: ListTile(
                    dense: true,
                    title: Text(
                      "Property Name",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Enter the property name',
                      ),
                    ),
                    isThreeLine: true,
                  ),
                ),
                new Expanded(
                  child: ListTile(
                    dense: true,
                    title: Text(
                      "Contact Name",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 19.0),
                      child: DropdownButton<int>(
                        items: [
                          DropdownMenuItem<int>(
                            value: 1,
                            child: Text(
                              "John Smith",
                            ),
                          ),
                          DropdownMenuItem<int>(
                            value: 2,
                            child: Text(
                              "Jon Doe",
                            ),
                          ),
                        ],
                        onChanged: (value) {},
                        value: 1,
                        hint: Text(
                          "Select Contact Name",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    isThreeLine: true,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ListTile(
                    dense: true,
                    title: Text(
                      "Property Name",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Enter the property name',
                      ),
                    ),
                    isThreeLine: true,
                  ),
                ),
                Expanded(
                  child: ListTile(
                    dense: true,
                    title: Text(
                      "Contact Name",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: DropdownButtonFormField<int>(
                      decoration: InputDecoration(
                        isDense: true,
                        hasFloatingPlaceholder: true,
                        labelText: 'Select Contact Name',
                        contentPadding: EdgeInsets.symmetric(vertical: 9),
                      ),
                      items: [
                        DropdownMenuItem<int>(
                          value: 1,
                          child: Text(
                            "John Smith",
                          ),
                        ),
                        DropdownMenuItem<int>(
                          value: 2,
                          child: Text(
                            "Jon Doe",
                          ),
                        ),
                      ],
                      onChanged: (value) {},
                    ),
                    isThreeLine: true,
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

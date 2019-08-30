// import 'dart:convert';
// import 'package:sqlliteapp/db_helper.dart';
// import 'package:sqlliteapp/user_model.dart';
// import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class UserModel {
  String name;
  String username;
  String email;
  String password;

  UserModel(
    this.name,
    this.username,
    this.email,
    this.password,
  );
}

class DatabaseHelper {
  DatabaseHelper();

  void saveData(UserModel user) {}

  Future<List<UserModel>> getUserModelData() async {
    print("Init dropdown from DB");
    await Future.delayed(Duration(seconds: 1));

    UserModel user1 = UserModel(
      "test",
      "test",
      "test@gmail.com",
      "test",
    );

    UserModel user2 = UserModel(
      "test1",
      "test1",
      "test1@gmail.com",
      "test",
    );

    List<UserModel> users = [];
    users.add(user1);
    users.add(user2);
    return Future.value(users);
  }
}

class SqliteDropdown extends StatefulWidget {
  @override
  SqliteDropdownState createState() {
    return new SqliteDropdownState();
  }
}

class SqliteDropdownState extends State<SqliteDropdown> {
  DatabaseHelper db = DatabaseHelper();

  //Add data to db
  _saveData() async {
    UserModel user1 = UserModel(
      "test",
      "test",
      "test@gmail.com",
      "test",
    );

    UserModel user2 = UserModel(
      "test1",
      "test1",
      "test1@gmail.com",
      "test",
    );
    await db.saveData(user1);
    await db.saveData(user2);
  }

  @override
  void initState() {
    super.initState();
    _saveData();
  }

  UserModel _currentUser;

  @override
  Widget build(BuildContext context) {
    print("Build function is Called");
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetching data from Sqlite DB - DropdownButton'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            FutureBuilder<List<UserModel>>(
                future: db.getUserModelData(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<UserModel>> snapshot) {
                  if (!snapshot.hasData) return CircularProgressIndicator();
                  return DropdownButton<UserModel>(
                    items: snapshot.data
                        .map((user) => DropdownMenuItem<UserModel>(
                              child: Text(user.name),
                              value: user,
                            ))
                        .toList(),
                    onChanged: (UserModel value) {
                      setState(() {
                        _currentUser = value;
                      });
                    },
                    isExpanded: true,
                    value: _currentUser,
                    hint: Text('Select User'),
                  );
                }),
            SizedBox(height: 20.0),
            _currentUser != null
                ? Text(
                    "Name: " +
                        _currentUser.name +
                        "\n Email: " +
                        _currentUser.email +
                        "\n Username: " +
                        _currentUser.username +
                        "\n Password: " +
                        _currentUser.password,
                  )
                : Text("No User selected"),
          ],
        ),
      ),
    );
  }
}

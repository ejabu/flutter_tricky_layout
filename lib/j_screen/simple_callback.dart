import 'package:flutter/material.dart';

class CreateForm extends StatefulWidget {
  CreateForm({Key key}) : super(key: key);

  CreateFormState createState() => CreateFormState();
}

class CreateFormState extends State<CreateForm> {
  bool userDetailsCompleted = false;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return !userDetailsCompleted
        ? UserDetailsForm(
            completed: () {
              print("testing");
              setState(() {
                userDetailsCompleted = true;
              });
            },
          )
        : Center(
            child: Text(
              "Complete",
            ),
          );
  }
}

class UserDetailsForm extends StatefulWidget {
  final Function completed;

  UserDetailsForm({@required this.completed, Key key}) : super(key: key);

  UserDetailsFormState createState() => UserDetailsFormState();
}

class UserDetailsFormState extends State<UserDetailsForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: RaisedButton(
        child: Text('Submit'),
        onPressed: () {
          print('UserDetails account form submit');
          widget.completed();
        },
      ),
    );
  }
}

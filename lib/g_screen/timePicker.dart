import 'package:flutter/material.dart';

class TimePickerScreen extends StatelessWidget {
  static const int saturday = 6;

  int daysToAdd(int todayIndex, int targetIndex) {
    if (todayIndex < targetIndex) { // jump to target day in same week
      return targetIndex - todayIndex;
    } else if (todayIndex > targetIndex) { // must jump to next week
      return 7 + targetIndex - todayIndex;
    } else {
      return 0; // date is matched
    }
  }

  DateTime defineInitialDate() {
    DateTime now = DateTime.now();
    int dayOffset = daysToAdd(now.weekday, saturday);
    return now.add(Duration(days: dayOffset));
  }

  bool defineSelectable(DateTime val) {
    DateTime now = DateTime.now();

    if (val.isBefore(now)) {
      return false;
    }

    switch (val.weekday) {
      case saturday:
        return true;
        break;
      default:
        return false;
    }
  }

  void handleButton(context) async {
    DateTime chosenDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2019),
      lastDate: DateTime(2020),
      initialDate: defineInitialDate(),
      selectableDayPredicate: defineSelectable,
    );

    print("R: ${chosenDate.toLocal()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complex Time Picker'),
      ),
      body: Center(
        child: RaisedButton.icon(
          icon: Icon(Icons.calendar_today),
          label: Text("Pick Date"),
          onPressed: () {
            handleButton(context);
          },
        ),
      ),
    );
  }
}


## Our Requirements

how to : 

- disabled all days except Sats

- also how I can disable all Days before today even Sats

- set initial date for the first Sat after today if it's not Sat 

- or today if it's Sat as default value in dataPicker

### How to Disable days

``` dart

  bool defineSelectable(DateTime val) {
    DateTime now = DateTime.now();
    // disabled all days before today
    if (val.isBefore(now)) {
      return false;
    }
    // disabled all days except Sats
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
      ...
      selectableDayPredicate: defineSelectable,
    );
  }
```

### How to Initiate Date

``` dart

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

  void handleButton(context) async {
    DateTime chosenDate = await showDatePicker(
      ...
      initialDate: defineInitialDate(),
      ...
    );
  }
```


## Full Code

You may look into this repo and build it locally [TimePickerScreen]()

## Demo

[![Demo][1]][1]


  [1]: https://i.stack.imgur.com/1sbOk.gif

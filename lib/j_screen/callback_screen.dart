import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HorizontalCalendar extends StatefulWidget {
  final double height;
  final double width;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final int month;
  final int year;
  final int selectedDate; // this is immutable
  HorizontalCalendar({
    @required this.year,
    @required this.month,
    this.selectedDate,
    this.height,
    this.width,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(0),
  });
  @override
  _HorizontalCalendarState createState() => _HorizontalCalendarState();
}

class _HorizontalCalendarState extends State<HorizontalCalendar> {

  int selectedDay; // this is mutable

  @override
  void initState() {
    selectedDay = widget.selectedDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      margin: widget.margin,
      padding: widget.padding,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: DateTime(widget.year, widget.month + 1, 0).day,
        itemBuilder: (context, index) {
          index = index + 1;
          DateTime date = DateTime(widget.year, widget.month, index);
          return DayWidget(
            day: index,
            dayName: DateFormat('EEEE').format(date).substring(0, 3),
            selected: selectedDay == index ? true : false,
            callback: (int day) {
              selectedDay = day;
              setState((){});
            },
          );
        },
      ),
    );
  }
}

class DayWidget extends StatelessWidget {
  final int day;
  final String dayName;
  final bool selected;
  final Function(int) callback;
  DayWidget({
    this.day,
    this.dayName,
    this.selected = false,
    this.callback,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.17,
        child: FlatButton(
          color: selected ? Colors.white : Colors.transparent,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(15.0),
            side: BorderSide(
                color: selected ? Colors.white : Colors.grey,
                width: 1,
                style: BorderStyle.solid),
          ),
          onPressed: () {
            callback(day);
            // Here I should be able to change the selected date from
            // The HorizontalCalendar
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                dayName,
                style: TextStyle(
                  color: selected ? Colors.blueGrey : Colors.white60,
                  fontSize: 15,
                  fontWeight: selected ? FontWeight.w900 : FontWeight.w300,
                ),
              ),
              Text(
                day.toString(),
                style: TextStyle(
                  color: selected ? Colors.blueGrey : Colors.white,
                  fontSize: 24,
                  fontWeight: selected ? FontWeight.w900 : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: new ThemeData(
//               brightness: Brightness.dark,
//               primaryColorBrightness: Brightness.dark,
//       ),
//       home: TimeIssue(),
//     );
//   }
// }

class TimeIssue extends StatefulWidget {
  @override
  _TimeIssueState createState() => _TimeIssueState();
}

class _TimeIssueState extends State<TimeIssue> {

  // GETTING ACTUAL DATE
  static var _actualDatetimeUnformatted = new DateTime.now();

  // DATETIME OBJECT TOO, LIKE _actualDatetimeUnformatted BUT WITH A FEW DAYS ADDED TO IT (TO GET THE END OF THE WEEK!)
  static var _weekEndDatetimeUnformatted = _actualDatetimeUnformatted.add(
      new Duration(days: getWeekday(_actualDatetimeUnformatted)));  // RED SCREEN MISTAKE SOMEWHERE HERE IN "getWeekday" method!

  // GET MONTH, DAY, YEAR (AS END OF WEEK)
  static getWeekday(_actualDatetimeUnformatted) {
    if (_actualDatetimeUnformatted.weekday == DateTime.monday) {
      return 6;
    } else if (_actualDatetimeUnformatted.weekday == DateTime.tuesday) {
      return 5;
    } else if (_actualDatetimeUnformatted.weekday == DateTime.wednesday) {
      return 4;
    } else if (_actualDatetimeUnformatted.weekday == DateTime.thursday) {
      return 3;
    } else if (_actualDatetimeUnformatted.weekday == DateTime.friday) {
      return 2;
    } else if (_actualDatetimeUnformatted.weekday == DateTime.saturday) {
      return 1;
    } else if (_actualDatetimeUnformatted.weekday == DateTime.sunday) {
      return 0;
    }
  }

  // GET MONTH, DAY (AS START OF WEEK)
  static var formatterWeekdayAll = new DateFormat("MMM d");

  // GET WEEKDAY
  static var formatterDay = new DateFormat("EEEE");

  // GETTING WEEKDAY FOR SELECTED DAY (above the weekdays)
  String _selectedDay = formatterDay.format(_actualDatetimeUnformatted);

  // RETURNING WEEKDAY FOR APP TEXT AS WELL AS END OF WEEK CALCULATED FROM THE DAY OF _WEEKDAY (above the current day (_selectedDay))
  String _Weekday = formatterWeekdayAll.format(_actualDatetimeUnformatted); //WORKS
  String _WeekdayEnd = formatterWeekdayAll.format(_weekEndDatetimeUnformatted);

  String text = "Some Note...";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 380.0,
                  ),
                  // ShaderMask(
                  //     shaderCallback: (rect) {
                  //       return LinearGradient(
                  //           begin: Alignment.topCenter,
                  //           end: Alignment.bottomCenter,
                  //           colors: [Colors.black, Colors.transparent])
                  //           .createShader(
                  //           Rect.fromLTRB(0, 0, rect.width, rect.height));
                  //     },
                  //     blendMode: BlendMode.dstIn,
                  //     child: Image.asset('assets/milchstraße.jpg',
                  //         height: 300.0, fit: BoxFit.cover)),
                  RotatedBox(
                    quarterTurns: 0,
                    child: Text('Weekly Planner',
                        style: TextStyle(
                            fontSize: 55,
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withOpacity(0.35),
                            letterSpacing: 10.0)),
                  ),
                  Positioned(
                    top: 4.0,
                    right: 4.0,
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white),
                      child: Center(
                        child: Icon(Icons.menu),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 2.0,
                    right: 5.0,
                    child: Container(
                      height: 12.0,
                      width: 12.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: Color(0xFFFD3664)),
                    ),
                  ),
                  Positioned(
                      top: 170.0,
                      left: 10.0,
                      child: Column(
                        children: <Widget>[
                          Text("It's week:",
                              style: TextStyle(
                                  fontFamily: 'Oswald-Light',
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white))
                        ],
                      )),
                  Positioned(
                      top: 280.0,
                      left: 120.0,
                      child: Column(
                        children: <Widget>[
                          Text("$_selectedDay",
                              style: TextStyle(
                                  fontFamily: 'Oswald-Light',
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white))
                        ],
                      )),
                  Positioned(
                      top: 210.0,
                      left: 10.0,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text('From $_Weekday. to $_WeekdayEnd.',
                                  style: TextStyle(
                                      fontFamily: 'Oswald-Light',
                                      fontSize: 35.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFFD3664))),
                            ],
                          )
                        ],
                      )),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                _buildWeekDays('Monday', Icons.calendar_today, text),
                _buildWeekDays('Tuesday', Icons.calendar_today, text),
                _buildWeekDays('Wednesday', Icons.calendar_today, text),
                _buildWeekDays('Thursday', Icons.calendar_today, text),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                _buildWeekDays('Friday', Icons.calendar_today, text),
                _buildWeekDays('Saturday', Icons.calendar_today, text),
                _buildWeekDays('Sunday', Icons.calendar_today, text),
              ]),
            ]));
  }

  Widget _buildWeekDays(String day, iconData, text) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        _WeekPlanRoute(day, text); // MISTAKE SOMEWHERE IN THIS METHOD!!!
      },
      child: AnimatedContainer(
          curve: Curves.easeIn,
          duration: Duration(microseconds: 300),
          height: _selectedDay == 'day' ? 100.0 : 100.0,
          width: _selectedDay == 'day' ? 100.0 : 75.0,
          color: _selectedDay == 'day' ? Color(0xFFFD3566) : Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                color: _selectedDay == day ? Colors.white : Colors.grey,
                size: 40.0,
              ),
              SizedBox(height: 10.0),
              Text(day,
                  style: TextStyle(
                      fontFamily: 'Oswald-Light',
                      color: _selectedDay == day ? Colors.white : Colors.grey,
                      fontSize: 15.0))
            ],
          )),
    );
  }

  void _WeekPlanRoute(day, text) {
    selectMenuOption(day);
    Navigator.of(context).push(
      MaterialPageRoute<void>(
          builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  '$day',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Oswald-Light',
                    color: Color(0xFFFD3566),
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
              ),
              body: new Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 5.0),
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 10.0),
                decoration: new BoxDecoration(
                  color: Colors.green.shade200.withOpacity(0.3),
                  borderRadius: new BorderRadius.circular(5.0),
                ),
                child: new IntrinsicHeight(
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.only(
                            top: 4.0, bottom: 4.0, right: 10.0),
                        child: Text(
                          text, // DYNAMICALLY FOR USERS!
                          textAlign: TextAlign.justify,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: TextStyle(
                            fontFamily: 'Oswald-Light',
                            fontSize: 20,
                            fontWeight: FontWeight.w200,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: InkWell(
                          child: Icon(
                            Icons.star_border,
                            size: 40,
                          ),
                          onTap: () {
                            setToFav(text);
                          },
                          onDoubleTap: () {
                            // DELETE COLOR FROM THE STAR
                            // DELETE IT FROM ARRAY OF IMPORTANT NOTES!
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
      ),
    );
  }

  selectMenuOption(String day) {
    setState(() {
      _selectedDay = day;
    });
  }

  setToFav(String text) {
    setState(() {
      //final bool favourized = _saved.contains(pair)
    });

  }
}
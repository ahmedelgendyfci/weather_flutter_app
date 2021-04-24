import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/screens/search_location_screen.dart';
import 'dart:convert';
import 'package:weather/services/location.dart';

class CurrentLocationScreen extends StatefulWidget {
  final data;

  CurrentLocationScreen({this.data});

  @override
  _CurrentLocationScreenState createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
  // get current location service

  MyLocation newLocation = MyLocation();

  int day;
  String month;
  int year;

  String city;
  String country;

  String status;
  double temp;

  // String data;

  void getLocation(String data) async {
    setState(() {
      // print(data);
      city = jsonDecode(data)['name'];
      country = jsonDecode(data)['sys']['country'];
      status = jsonDecode(data)['weather'][0]['main'];
      temp = ((jsonDecode(data)['main']['temp']) - 273.15);
    });
  }

  void getDate() {
    DateTime dateTime = DateTime.now();
    setState(() {
      day = dateTime.day;
      int mon = dateTime.month;
      year = dateTime.year;

      if (mon == 1) {
        month = 'January';
      } else if (mon == 2) {
        month = 'February ';
      } else if (mon == 3) {
        month = 'March ';
      } else if (mon == 4) {
        month = 'April ';
      } else if (mon == 5) {
        month = 'May ';
      } else if (mon == 6) {
        month = 'June ';
      } else if (mon == 7) {
        month = 'July ';
      } else if (mon == 8) {
        month = 'August ';
      } else if (mon == 9) {
        month = 'September';
      } else if (mon == 10) {
        month = 'October';
      } else if (mon == 11) {
        month = 'November';
      } else {
        month = 'December';
      }
    });
    // print(dateTime.month.toString());
  }

  @override
  void initState() {
    String data = widget.data;
    getDate();
    getLocation(data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Weather'),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.black87.withOpacity(0.1), BlendMode.dstIn),
            image: AssetImage('images/wmbg.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        child: Row(
                          children: [
                            Text(day.toString()),
                            Text(','),
                            Text(month),
                            Text(year.toString()),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Align(
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.mapMarkerAlt,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            city != null ? city : 'loading...',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                          Row(
                            children: [
                              Text(', '),
                              Text(
                                country != null ? country : 'loading...',
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Image.asset('images/cloud1.png'),
              // child: Icon(
              //   FontAwesomeIcons.cloud,
              //   size: 100,
              //   color: Color(0xff30a5e0),
              // ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Text(
                    status != null ? status : 'loading..',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          temp != null ? temp.toStringAsFixed(0) : '0',
                          style: TextStyle(
                            fontSize: 65,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'o',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Icon(FontAwesomeIcons.cloudSunRain),
                        Text('19, March'),
                        Text('11'),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(FontAwesomeIcons.cloudSunRain),
                        Text('19, March'),
                        Text('11'),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(FontAwesomeIcons.cloudSunRain),
                        Text('19, March'),
                        Text('11'),
                      ],
                    ),
                  ],
                )),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: IconButton(
                      icon: FaIcon(FontAwesomeIcons.home),
                      onPressed: () {
                        // getLocation();
                      },
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                        icon: FaIcon(FontAwesomeIcons.search),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SearchLocationScreen();
                          }));
                        }),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: FaIcon(FontAwesomeIcons.userAlt),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Icon(FontAwesomeIcons.cloudSunRain)

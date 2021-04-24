import 'package:flutter/material.dart';
import 'package:weather/services/location.dart';
import 'dart:convert';
import 'current_location_screen.dart';

class SearchLocationScreen extends StatefulWidget {
  @override
  _SearchLocationScreenState createState() => _SearchLocationScreenState();
}

class _SearchLocationScreenState extends State<SearchLocationScreen> {
  String city;
  MyLocation newLocation = MyLocation();

  String msg = 'This Location Not Found, Try Again Please.';
  bool flag = false;

  void getWeather() async {
    String data = await newLocation.cityLocation(city);

    var code = jsonDecode(data)['cod'];

    setState(() {
      flag = code != '404' && code != 404 ? false : true;
    });

    if (!flag) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return CurrentLocationScreen(
            data: data,
          );
        }),
      );
    }

    // print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Search about location')),
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          colorFilter: new ColorFilter.mode(
              Colors.black87.withOpacity(0.1), BlendMode.dstIn),
          image: AssetImage('images/wmbg.png'),
        )),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  flag = false;
                });
                city = value;
              },
              style: TextStyle(
                height: 1,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  isDense: true,
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'type your city here...',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                width: 150,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.teal,
                ),
                // ignore: deprecated_member_use
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      getWeather();
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        size: 15,
                      ),
                      Text('Search'),
                    ],
                  ),
                )),
            Expanded(
                child: Center(
              child: Text(
                flag ? msg : '',
              ),
            ))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/services/location.dart';
import 'current_location_screen.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  MyLocation newLocation = MyLocation();

  String response;
  void getData() async {
    response = await newLocation.myCurrentLocation();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return CurrentLocationScreen(
        data: response,
      );
    }));
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text('Weather'),
            ),
          ),
          body: Center(
            child: SpinKitRipple(
              color: Colors.white,
              size: 150.0,
            ),
          ),
        ),
      ),
    );
  }
}

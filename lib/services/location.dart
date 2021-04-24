// import 'package:location/location.dart';
import 'package:http/http.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:convert';

class MyLocation {
  MyLocation();

  // Location location = new Location();
  // LocationData _locationData;

  double lat;
  double lon;

  Future<dynamic> _getCurrentLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  Future<String> myCurrentLocation() async {
    Position position = await _getCurrentLocation();
    lat = position.latitude;
    lon = position.longitude;
    // print('------------------------------------position------------------');
    // print(position);
    // print('$lat ... $lon');
    // print('------------------------------------position------------------');
    Response response = await get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=f1276a525fdaa873e3fae315387defbd');
    return response.body;
  }

  Future<String> cityLocation(String city) async {
    Response response = await get(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=f1276a525fdaa873e3fae315387defbd');

    return response.body;
  }
}

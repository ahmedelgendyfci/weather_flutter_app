import 'package:flutter/material.dart';
import 'screens/current_location_screen.dart';
import 'screens/loading_screen.dart';
import 'screens/search_location_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = {
    '': (context) => CurrentLocationScreen(),
    '/loading': (context) => LoadingScreen(),
    '/location': (context) => SearchLocationScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff101014),
        primaryColor: Color(0xff101014),
      ),
      routes: routes,
      // theme: ThemeData.dark(),
      home: LoadingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

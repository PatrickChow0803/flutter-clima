import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';

// Allows me to access the package by using the variable http.
// The benefit of this is that it's more clear what package I'm using.
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  // Returns the current user's location
  void getLocation() async {
    Location location = Location();
//    Need await because you need to wait to get the latitude and longitude values before printing them.
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  // Makes an API call to OpenWeatherMap to get weather information.
  void getData() async {
    http.Response response = await http.get(
        'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}

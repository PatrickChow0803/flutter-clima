import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../services/networking.dart';

const apiKey = '968d6abc89bba369ae34cbed22f8eada';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  // Returns the current user's location
  void getLocationData() async {
    Location location = Location();
//    Need await because you need to wait to get the latitude and longitude values before printing them.
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    print(latitude);
    print(longitude);

    NetworkHelper helper = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await helper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
// Makes an API call to OpenWeatherMap to get weather information.
//  void getData() async {
//    http.Response response = await http.get(
////      This is the get endpoint
//        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
//    if (response.statusCode == 200) {
//      String data = response.body;
////      print(data);
////      Look at the endpoint above for a better idea as to what's going on.
////      This sets the variable longitude equal to the JSON value of lon from the get endpoint.
//      double longitude = jsonDecode(data)['coord']['lon'];
//      print(longitude);
//
////      Similar to the Decode above. However because weather has a list, you need to index which list you want.
//      String description = jsonDecode(data)['weather'][0]['description'];
//      print(description);
//

//    } else {
//      print(response.statusCode);
//      print(response.body);
//    }
//  }

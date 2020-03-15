import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

//  Need the Future to be able to use await from the loading_screen.dart
  Future<void> getCurrentLocation() async {
    try {
      print('TESTING');
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}

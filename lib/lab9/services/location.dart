// // import 'package:geolocator/geolocator.dart';
// //
// // class Location {
// //   double? latitude;
// //   double? longitude;
// //
// //   Future<void> getCurrentLocation() async {
// //     try {
// //       Position position = await Geolocator.getCurrentPosition(
// //           desiredAccuracy: LocationAccuracy.low);
// //       latitude = position.latitude;
// //       longitude = position.longitude;
// //     } catch (e) {
// //       print(e);
// //     }
// //   }
// // }
// import 'package:location/location.dart' as loc;
//
// class Location {
//   double? latitude;
//   double? longitude;
//
//   Future<void> getCurrentLocation() async {
//     try {
//       loc.Location location = loc.Location();
//       bool _serviceEnabled;
//       loc.PermissionStatus _permissionGranted;
//       loc.LocationData _locationData;
//
//       _serviceEnabled = await location.serviceEnabled();
//       if (!_serviceEnabled) {
//         _serviceEnabled = await location.requestService();
//         if (!_serviceEnabled) return;
//       }
//
//       _permissionGranted = await location.hasPermission();
//       if (_permissionGranted == loc.PermissionStatus.denied) {
//         _permissionGranted = await location.requestPermission();
//         if (_permissionGranted != loc.PermissionStatus.granted) return;
//       }
//
//       _locationData = await location.getLocation();
//       latitude = _locationData.latitude;
//       longitude = _locationData.longitude;
//     } catch (e) {
//       print(e);
//     }
//   }
// }
import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) return;

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) return;
      }

      if (permission == LocationPermission.deniedForever) return;

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      latitude = position.latitude;
      longitude = position.longitude;

      print('[DEBUG] Lat: $latitude, Lon: $longitude');
    } catch (e) {
      print('[ERROR] Lỗi lấy vị trí: $e');
    }
  }
}

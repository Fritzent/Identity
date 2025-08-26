import 'package:geolocator/geolocator.dart';

class PermissionService {
  static Future<bool> ensureLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      return true;
    }
    permission = await Geolocator.requestPermission();
    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }
}
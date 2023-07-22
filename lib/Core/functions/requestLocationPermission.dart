import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

requestLocationPermission() async {
  bool serviceEnable;
  LocationPermission permission;
  serviceEnable = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnable) {
    return Get.snackbar(
      "Warning",
      "Please enable location Service",
    );
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Get.snackbar(
        "Warning",
        "Please give permission for loaction",
      );
    }
    if (permission == LocationPermission.deniedForever) {
      return Get.snackbar(
        "Warning",
        "This App can't be use with out location service",
      );
    }
  }
}

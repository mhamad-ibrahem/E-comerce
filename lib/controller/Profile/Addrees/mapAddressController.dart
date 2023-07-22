import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/Core/classes/statusRequest.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

abstract class MapAddressController extends GetxController {
  goToAddress();
  getCurrentLocation();
  addMarker(LatLng latLang);
}

class MapAddressControllerImplement extends MapAddressController {
  StatusRequest statusRequest = StatusRequest.loading;
  Position? position;
  List<Marker> markerList = [];
  double? lat;
  double? lang;

  @override
  goToAddress() {
    if (lat != null && lang != null) {
      Get.toNamed(AppRoute.addLoacation,
          arguments: {"lat": lat.toString(), "lang": lang.toString()});
    }
  }

  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();

  CameraPosition? kGooglePlex;

  CameraPosition kLake = const CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  @override
  getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
        target: LatLng(position!.latitude, position!.longitude), zoom: 14.32);
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  void onInit() {
    getCurrentLocation();
    super.onInit();
  }

  @override
  addMarker(latLang) {
    markerList.clear();
    markerList.add(Marker(markerId: const MarkerId("1"), position: latLang));
    lat = latLang.latitude;
    lang = latLang.longitude;
    update();
  }
}

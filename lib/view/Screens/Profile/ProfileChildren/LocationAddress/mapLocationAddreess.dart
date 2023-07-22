import 'package:ecommerce/Core/Constant/ScreenSize.dart';
import 'package:ecommerce/Core/classes/HandilingData.dart';
import 'package:ecommerce/controller/Profile/Addrees/mapAddressController.dart';
import 'package:ecommerce/view/Widget/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

class MapLocationAddreess extends StatelessWidget {
  MapLocationAddreess({super.key});
  MapAddressControllerImplement mapController =
      Get.put(MapAddressControllerImplement());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: GetBuilder<MapAddressControllerImplement>(
        builder: (controller) => HandilingDataView(
          statusRequest: controller.statusRequest,
          widget: Stack(
            children: [
              if(controller.kGooglePlex !=null)
              GoogleMap(
                mapType: MapType.normal,
                markers: controller.markerList.toSet(),
                onTap: (latLang){
                  controller.addMarker(latLang);
                },
                initialCameraPosition: mapController.kGooglePlex!,
                onMapCreated: (GoogleMapController controllermap) {
                  mapController.controller.complete(controllermap);
                },
              ),
              Positioned(
                left: 20,
                bottom: 20,
                child: CustomButton(
                    buttonBody: "Add Location",
                    onTap: () {
                      mapController.goToAddress();
                    },
                    buttonWidth: AppSize.screenWidth * 0.7),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
   
//AIzaSyB9pkCpUdlcM42f_w1rz7zfEu_ppJEW_fk
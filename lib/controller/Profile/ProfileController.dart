import 'dart:developer';
import 'dart:io';
import 'package:ecommerce/Core/classes/HiveBox.dart';
import 'package:ecommerce/Core/classes/HiveKeys.dart';
import 'package:ecommerce/view/Screens/OnBoarding/onBoardingPage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';

import '../../Core/classes/statusRequest.dart';
import '../../Core/functions/handilingData.dart';
import '../../data/DataSource/remote/profile/profile_data.dart';
import '../../data/model/profile/profile_model.dart';

abstract class ProfileController extends GetxController {
  logOut();
}

class ProfileImplement extends ProfileController {
  Box authBox = Hive.box(HiveBox.authBox);
  StatusRequest statusRequest = StatusRequest.none;
  ProfileData profileData = ProfileData(Get.find());
  late ProfileModel profileModel;
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController email = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StatusRequest statusRequest2 = StatusRequest.none;
  File? image;
  String? oldImageName;
  final imagePicker = ImagePicker();
  uploadGalleryImage() async {
    var pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      print(image);
      update();
    } else {}
  }

  uploadCameraImage() async {
    var pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      print(image);
      update();
    } else {}
  }

  updateProfile() async {
    var formData = formKey.currentState;
    if (formData!.validate()) {
      statusRequest2 = StatusRequest.loading;
      update();
      var response = await profileData.editProfile(
        userId: authBox.get(HiveKeys.idKey),
        address: location.text,
        email: email.text,
        name: userName.text,
        password: password.text,
        phone: number.text,
        oldImageName: image!.path.isEmpty ? oldImageName : '',
        image: image!,
      );
      statusRequest2 = handilingData(response);
      if (StatusRequest.success == statusRequest2) {
        if (response['status'] == 'success') {
          // log(response['data']);
          Get.back();
          getProfileData();
        } else {
          statusRequest2 = StatusRequest.faliure;
        }
      }
    }
    update();
  }

  @override
  logOut() async {
    String userId = authBox.get(HiveKeys.idKey);
    FirebaseMessaging.instance.unsubscribeFromTopic('users');
    FirebaseMessaging.instance.unsubscribeFromTopic('users$userId');
    await Hive.box(HiveBox.authBox).clear();
    await Hive.box(HiveBox.stepBox).clear();
    Get.offAll(OnBording());
  }

  getProfileData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await profileData.getData(authBox.get(HiveKeys.idKey));
    statusRequest = handilingData(response);
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        profileModel = ProfileModel.fromJson(response['data']);
        log(profileModel.email);
        // print(response['status']);
        userName.text = profileModel.name;
        email.text = profileModel.email;
        number.text = profileModel.number;
        location.text = profileModel.location;
        oldImageName = profileModel.image ?? '';
        update();
      }
    }
    update();
  }

  @override
  void onInit() {
    getProfileData();

    super.onInit();
  }
}

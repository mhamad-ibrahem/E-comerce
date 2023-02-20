import 'package:get/get.dart';
import 'package:flutter/material.dart';

abstract class AccountController extends GetxController{
  
}

class AccountImplement extends AccountController{
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController email = TextEditingController();
  GlobalKey formKey = GlobalKey();
  }

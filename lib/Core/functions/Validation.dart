import 'dart:developer';

import 'package:get/get.dart';

validation(String value, int min, int max, String type) {
  if (type == 'userName') {
    if (!GetUtils.isUsername(value)) {
      return 'Not valid user name ';
    }
  }
  if (type == 'emial') {
    if (!GetUtils.isEmail(value)) {
      return 'Email not valid';
    }
  }
  if (type == 'Number') {
    if (!GetUtils.isPhoneNumber(value)) {
      return 'Email not valid';
    }
  }
  if (value.isEmpty) {
    return "can't be empty";
  }
  if (value.length < min) {
    return "can't be less than $min";
  }
  if (value.length > max) {
    return "can't be more than $max";
  }
}

confirmValidate(String passwordValue, String confirmPasswordValue) {
  if (confirmPasswordValue != passwordValue) {
    return 'confirm password didnt match password';
  }

  String? validatePhone(String value, String countryCode, bool validate) {
    switch (countryCode) {
      case '+971': //UAE
        validate =
            // RegExp(r'^(?:\+971|00971|0)?(?:50|51|52|55|56|2|3|4|6|7|9)\d{7}$')
            //     .hasMatch(value);
            validate = RegExp(r'^05[0-59]\d{7}$').hasMatch(value);
        break;
      case '': //Egypt
        validate = RegExp(r'^01[0-2|5]\d{8}$').hasMatch(value);
        break;
    }
    log('$validate');
    if (validate == false) {
      return 'Please enter a valid phone number';
    } else {
      return null;
    }
  }
}

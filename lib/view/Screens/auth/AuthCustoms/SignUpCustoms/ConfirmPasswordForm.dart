import 'package:ecommerce/controller/AuthController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Core/Constant/Colors.dart';
import '../../../../../Core/Theme/Themes.dart';

class PasswordConfirmFormField extends StatelessWidget {
  PasswordConfirmFormField({
    Key? key,
    required this.originalPassword,
    required this.textEditingController,
  }) : super(key: key);
  final AuthController _authController = Get.find();
  final String originalPassword;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        validator: (val) {
          if (val!.isEmpty) {
            return 'Password Confirm can\'t be empty';
          }
          if (val != originalPassword) {
            return 'Confirm does\'nt match Password';
          }
          return null;
        },
        style: TextStyle(
            color: black,
            fontSize: 15,
            fontFamily: 'muli',
            fontWeight: FontWeight.bold),
        obscureText: true,
        maxLines: 1,
        cursorColor: deepGrey,
        onChanged: (val) {
          textEditingController.text = val;
          _authController.update();
        },
        decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.lock_outline,
              color: deepGrey,
            ),
            contentPadding:
                const EdgeInsets.only(left: 40, right: 0, top: 20, bottom: 20),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: 'Re-enter your Password',
            hintStyle: Themes().currentTheme.textTheme.headline1,
            labelText: '  Confirm Password  ',
            labelStyle: Themes().currentTheme.textTheme.headline1,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: deepGrey)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            )),
      ),
    );
  }
}

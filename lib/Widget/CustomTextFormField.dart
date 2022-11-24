import 'package:flutter/material.dart';

import '../../Constant/Colors.dart';
import '../../model/Themes.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    required this.icon,
    required this.label,
    required this.hint,
    required this.inputType,
    required this.obscure,
    required this.errorVal,
    required this.vallengthError,
    required this.valreturn,
    required this.textEditingController,
  }) : super(key: key);
  final IconData icon;
  final String label;
  final String hint;
  final TextInputType inputType;
  final bool obscure;
  final String errorVal;
  final int vallengthError;
  final String valreturn;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        validator: (val) {
          if (val!.isEmpty) {
            return '$errorVal can\'t be empty';
          }
          if (val.length < vallengthError) {
            return valreturn;
          }
          return null;
        },
        style: TextStyle(
            color: black,
            fontSize: 15,
            fontFamily: 'muli',
            fontWeight: FontWeight.bold),
        obscureText: obscure,
        keyboardType: inputType,
        maxLines: 1,
        cursorColor: deepGrey,
        onChanged: (val) {
          textEditingController.text = val;
        },
        decoration: InputDecoration(
            suffixIcon: Icon(
              icon,
              color: deepGrey,
            ),
            contentPadding:
                const EdgeInsets.only(left: 40, right: 0, top: 20, bottom: 20),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: hint,
            hintStyle: Themes().currentTheme.textTheme.headline1,
            labelText: label,
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

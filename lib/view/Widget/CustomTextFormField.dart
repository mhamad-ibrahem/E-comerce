import 'package:flutter/material.dart';

import '../../Core/Constant/Colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.icon,
    required this.label,
    this.hint,
    required this.obscure,
    required this.textEditingController,
    required this.validator,
    this.inputType,
    @required this.suffixIcon,
    this.onChange,
  }) : super(key: key);
  final IconData icon;
  final String label;
  final String? hint;
  final bool obscure;
  final TextInputType? inputType;
  final TextEditingController textEditingController;
  final String? Function(String?) validator;
  final Widget? suffixIcon;
  final void Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      controller: textEditingController,
      validator: validator,
      style: const TextStyle(
          color: AppColor.black,
          fontSize: 15,
          fontFamily: 'muli',
          fontWeight: FontWeight.bold),
      obscureText: obscure,
      maxLines: 1,
      cursorColor: AppColor.deepGrey,
      keyboardType: inputType,
      decoration: InputDecoration(
          fillColor: AppColor.black,
          suffixIcon: suffixIcon,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              icon,
              color: AppColor.deepGrey,
            ),
          ),
          contentPadding:
              const EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 20),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hint,
          hintStyle: Theme.of(context).textTheme.headline1,
          labelText: label,
          labelStyle: const TextStyle(
            fontSize: 17,
            color: AppColor.deepOrange,
            fontWeight: FontWeight.bold,
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:
                  const BorderSide(color: AppColor.deepOrange, width: 2)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: AppColor.deepGrey)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: AppColor.red, width: 2)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          )),
    );
  }
}

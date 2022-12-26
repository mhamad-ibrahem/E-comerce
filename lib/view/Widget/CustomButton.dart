import 'package:flutter/material.dart';

import '../../Core/Constant/Colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.buttonBody,
    required this.onTap,
    required this.leftPadding,
    required this.rightPadding,
  }) : super(key: key);
  final VoidCallback onTap;
  final String buttonBody;
  final double leftPadding;
  final double rightPadding;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      color:AppColor.deepOrange,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      padding: EdgeInsets.only(
          left: leftPadding, right: rightPadding, top: 20, bottom: 20),
      child: Text(
        buttonBody,
        style:
            const TextStyle(color:AppColor. white, fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}

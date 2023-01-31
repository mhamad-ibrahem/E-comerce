import 'package:flutter/material.dart';

import '../../Core/Constant/Colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.buttonBody,
    required this.onTap,
   required this.buttonWidth,
  }) : super(key: key);
  final double buttonWidth;
  final VoidCallback? onTap;
  final String buttonBody;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      color: AppColor.deepOrange,
      disabledColor: AppColor.deepGrey,
      disabledTextColor: AppColor.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      padding:const EdgeInsets.only(
          top: 20, bottom: 20),
      child: SizedBox(
        width: buttonWidth,
        child: Center(
          child: Text(
            buttonBody,
            style:
                const TextStyle(color:AppColor. white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

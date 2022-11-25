import 'package:flutter/material.dart';

import '../../Core/Constant/Colors.dart';
import '../../Core/Theme/Themes.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onTap,
    required this.buttonBody,
    required this.buttonradius,
    required this.containerWidth,
  }) : super(key: key);

  final Function() onTap;
  final String buttonBody;
  final double buttonradius;
  final double containerWidth;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: containerWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(buttonradius),
          color: deepOrange,
        ),
        child: Center(
          child: Text(
            buttonBody,
            style: Themes().currentTheme.textTheme.headline5,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

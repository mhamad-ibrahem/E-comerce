import 'package:flutter/material.dart';

class DotColors extends StatelessWidget {
  const DotColors({
    Key? key,
    required this.dotColor,
  }) : super(key: key);
  final Color dotColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40), color: dotColor),
    );
  }
}

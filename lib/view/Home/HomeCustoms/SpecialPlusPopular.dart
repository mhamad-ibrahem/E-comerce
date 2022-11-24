import 'package:flutter/material.dart';

import '../../../Constant/Colors.dart';
import '../../../model/Themes.dart';

class SpecialPlusPopular extends StatelessWidget {
  const SpecialPlusPopular({
    Key? key,
    required this.blackText,
  }) : super(key: key);
  final String blackText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          blackText,
          style: TextStyle(
              color: black,
              fontSize: 20,
              fontFamily: 'muli',
              fontWeight: FontWeight.w400),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'See More',
            style: Themes().currentTheme.textTheme.headline6,
          ),
        )
      ],
    );
  }
}

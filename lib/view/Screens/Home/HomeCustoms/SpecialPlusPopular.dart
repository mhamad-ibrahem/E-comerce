import 'package:flutter/material.dart';

import '../../../../Core/Constant/Colors.dart';

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
          style: const TextStyle(
              color:AppColor. black,
              fontSize: 20,
              fontFamily: 'muli',
              fontWeight: FontWeight.w500),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'See More',
            style: Theme.of(context).textTheme.headline6,
          ),
        )
      ],
    );
  }
}

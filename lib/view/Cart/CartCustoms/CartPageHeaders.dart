import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/Themes.dart';
import '../../../model/functions.dart';

class CartPageHeaders extends StatelessWidget {
  const CartPageHeaders({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back)),
        Column(
          children: [
            Text(
              'Your Cart',
              style: biggerBlackTextStyle(),
            ),
            Text(
              '4 items',
              style: Themes().currentTheme.textTheme.headline6,
            ),
          ],
        ),
        const SizedBox(
          width: 30,
        )
      ],
    );
  }
}

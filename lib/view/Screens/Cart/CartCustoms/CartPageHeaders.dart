import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Constant/fonts.dart';

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
              style: Theme.of(context).textTheme.headline6,
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

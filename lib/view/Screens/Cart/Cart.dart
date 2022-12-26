import 'package:flutter/material.dart';
import 'CartCustoms/BottomSizedBox.dart';
import 'CartCustoms/CartItemsList.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(
                height: 20,
              ),
              //Upper Part Of the Page That Can be Scrolled
              CartItemsList(),
              // Bottom Part of The Page That Contains Voucher Code
              BottomSizedBox()
            ]),
      ),
    ));
  }
}

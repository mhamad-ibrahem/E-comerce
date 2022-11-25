import 'package:flutter/material.dart';

import '../../../../Core/Theme/Themes.dart';
import '../../../../data/model/functions.dart';
import 'CartItem.dart';
import 'CartPageHeaders.dart';
import 'StoreName.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: const [
          //Top Bar of The Page
          CartPageHeaders(),
          SizedBox(
            height: 40,
          ),
          StoreName(storeName: 'Wano Store'),
          SizedBox(
            height: 40,
          ),

          CartItem(
            image: 'assets/images/ps4_console_white_1.png',
            price: '64.99',
            quantity: '1',
            title: 'Wireless Controller for\nPS4',
          ),
          SizedBox(
            height: 20,
          ),
          CartItem(
              image: 'assets/images/wireless headset.png',
              title: 'Logetich Zone Wireless\n Headset',
              price: '90.00',
              quantity: '1'),
          SizedBox(
            height: 20,
          ),
          StoreName(storeName: 'Sprotz Store'),
          SizedBox(
            height: 40,
          ),
          CartItem(
            image: 'assets/images/shoes2.png',
            price: '131.18',
            quantity: '1',
            title: 'Nike Joyride Run Flyknit\n-Men\'s Running',
          ),
          SizedBox(
            height: 20,
          ),
          CartItem(
              image: 'assets/images/tshirt.png',
              title: 'Orange T-Shirt for Men\nWith Discount',
              price: '30.99',
              quantity: '1'),
        ],
      ),
    );
  }
}

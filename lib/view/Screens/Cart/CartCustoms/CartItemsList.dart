import 'package:ecommerce/Core/Constant/imageAsset.dart';
import 'package:flutter/material.dart';
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
            image: AppImageAsset.ps4consolewhiteimage1,
            price: '64.99',
            quantity: '1',
            title: 'Wireless Controller for\nPS4',
          ),
          SizedBox(
            height: 20,
          ),
          CartItem(
              image: AppImageAsset.wirelessHeadsetimage,
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
            image: AppImageAsset.shoesimage,
            price: '131.18',
            quantity: '1',
            title: 'Nike Joyride Run Flyknit\n-Men\'s Running',
          ),
          SizedBox(
            height: 20,
          ),
          CartItem(
              image: AppImageAsset.tshirtimage,
              title: 'Orange T-Shirt for Men\nWith Discount',
              price: '30.99',
              quantity: '1'),
        ],
      ),
    );
  }
}

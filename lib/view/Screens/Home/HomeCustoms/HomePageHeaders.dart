import 'package:ecommerce/view/Screens/Cart/Cart.dart';
import 'package:ecommerce/view/Widget/RedDot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Core/Constant/Colors.dart';
import '../../../../Core/Theme/Themes.dart';

class HomePageHeaders extends StatelessWidget {
  const HomePageHeaders({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
                color: lightGrey, borderRadius: BorderRadius.circular(10)),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Search product',
                  hintStyle: Themes().currentTheme.textTheme.headline1,
                  prefixIcon: Icon(
                    Icons.search,
                    color: deepGrey,
                  ),
                  border: InputBorder.none),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: CircleAvatar(
            backgroundColor: lightGrey,
            radius: 25,
            child: IconButton(
                onPressed: () => Get.to(Cart()),
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: deepGrey,
                )),
          ),
        ),
        Expanded(
            flex: 1,
            child: Stack(
              children: [
                CircleAvatar(
                  backgroundColor: lightGrey,
                  radius: 25,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications_outlined,
                        color: deepGrey,
                      )),
                ),
                redDot()
              ],
            ))
      ],
    );
  }
}

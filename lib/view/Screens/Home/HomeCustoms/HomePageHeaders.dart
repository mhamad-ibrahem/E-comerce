import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/view/Widget/RedDot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Constant/Colors.dart';

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
                color: AppColor.lightGrey, borderRadius: BorderRadius.circular(10)),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Search product',
                  hintStyle: Theme.of(context).textTheme.headline1,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColor.deepGrey,
                  ),
                  border: InputBorder.none),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: CircleAvatar(
            backgroundColor:AppColor. lightGrey,
            radius: 25,
            child: IconButton(
                onPressed: () => Get.toNamed( AppRoute.cart),
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color:AppColor. deepGrey,
                )),
          ),
        ),
        Expanded(
            flex: 1,
            child: Stack(
              children: [
                CircleAvatar(
                  backgroundColor:AppColor. lightGrey,
                  radius: 25,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications_outlined,
                        color:AppColor. deepGrey,
                      )),
                ),
                redDot()
              ],
            ))
      ],
    );
  }
}

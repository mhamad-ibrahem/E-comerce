import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/view/Widget/RedDot.dart';
import 'package:flutter/material.dart';
import '../../../../Core/Constant/Colors.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;

class HomePageHeaders extends StatelessWidget {
  const HomePageHeaders({
    Key? key,
    required this.onChanged,
    required this.search,
    required this.onSearch,
  }) : super(key: key);
  final void Function(String)? onChanged;
  final TextEditingController search;
  final void Function()? onSearch;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: Container(
              decoration: BoxDecoration(
                  color: AppColor.lightGrey,
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                onChanged: onChanged,
                controller: search,
                decoration: InputDecoration(
                  hintText: "Search Product",
                  fillColor: AppColor.black,
                  hintStyle: Theme.of(context).textTheme.headline1,
                  border: InputBorder.none,
                  prefixIcon: IconButton(
                      onPressed: onSearch,
                      icon: const Icon(
                        Icons.search,
                        color: AppColor.deepGrey,
                      )),
                ),
                style: const TextStyle(
                    color: AppColor.black,
                    fontSize: 15,
                    fontFamily: 'muli',
                    fontWeight: FontWeight.bold),
                cursorColor: AppColor.deepGrey,
              )),
        ),
        Expanded(
          flex: 1,
          child: CircleAvatar(
            backgroundColor: AppColor.lightGrey,
            radius: 25,
            child: IconButton(
                onPressed: () => Get.toNamed(AppRoute.cart),
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColor.deepGrey,
                )),
          ),
        ),
        badges.Badge(
          position: badges.BadgePosition.topEnd(top: -2, end: -2,),
          showBadge: true,
          ignorePointer: false,
          onTap: () {},
          badgeContent: const Text('3'),
          badgeAnimation: const badges.BadgeAnimation.size(),
          badgeStyle: const badges.BadgeStyle(
            shape: badges.BadgeShape.circle,
            badgeColor: Colors.red,
            padding: EdgeInsets.all(5),
            elevation: 0,
          ),
          child: CircleAvatar(
            backgroundColor: AppColor.lightGrey,
            radius: 25,
            child: IconButton(
                onPressed: () {
                  Get.toNamed(AppRoute.notifications);
                },
                icon: const Icon(
                  Icons.notifications_outlined,
                  color: AppColor.deepGrey,
                )),
          ),
        ),
      ],
    );
  }
}

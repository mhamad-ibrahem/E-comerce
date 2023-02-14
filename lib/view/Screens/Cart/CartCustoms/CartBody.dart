import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/Cart/CartController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Core/Constant/Colors.dart';
import '../../../../Core/Constant/ScreenSize.dart';
import '../../../../Core/Constant/fonts.dart';

class CartBody extends GetView<CartController> {
  const CartBody({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.quantity,
  }) : super(key: key);
  final String image;
  final String title;
  final String price;
  final String quantity;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        padding: EdgeInsets.only(left: AppSize.screenWidth / 1.7),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColor.lightPink,
        ),
        child: const Icon(
          Icons.delete_outline_outlined,
          color: AppColor.red,
          size: 30,
        ),
      ),
      key: UniqueKey(),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 120,
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.lightGrey),
            child: CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.scaleDown,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                maxLines: 2,
                style: smallerBlackTextStyle(),
                overflow: TextOverflow.fade,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\n\$ $price ',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 25,top: 25,right: 25),
                    alignment: Alignment.bottomRight,
                    height: 30,
                    decoration: BoxDecoration(
                      color: AppColor.lightGrey,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add,
                              color: AppColor.black,
                              size: 12,
                            )),
                        Text(
                          quantity,
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(color: AppColor.black),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.remove,
                              color: AppColor.black,
                              size: 12,
                            )),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Core/Constant/ScreenSize.dart';
import 'package:ecommerce/controller/Home/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Core/Constant/Colors.dart';
import '../../../../Core/Constant/apiLinks.dart';

class ItemSearchProduct extends GetView<HomeControllerImplement> {
  const ItemSearchProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.screenWidth,
      height: AppSize.screenHight *0.7,
      child: ListView.separated(
        itemCount: controller.searchItem.length,
        itemBuilder: (context, index) => Row(children: [
          Container(
            height: 100,
            width: 120,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(bottom: 15, left: 20, right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColor.lightGrey),
            child: CachedNetworkImage(
              imageUrl: "${AppLinks.itemsImageLink}/${controller.searchItem[index].itemImage}",
              fit: BoxFit.scaleDown,
            ),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              controller.searchItem[index].itemName!,
              maxLines: 2,
              style: const TextStyle(
                  color: AppColor.black, fontWeight: FontWeight.bold),
              overflow: TextOverflow.fade,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Rate : ${controller.searchItem[index].itemRate}",
                  style: Theme.of(context).textTheme.headline2,
                ),
                const Icon(
                  Icons.star,
                  color: AppColor.yellow,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ]),
        ]),
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          height: 20,
        ),
      ),
    );
  }
}

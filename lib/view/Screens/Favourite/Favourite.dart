import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Core/Constant/Colors.dart';
import 'package:ecommerce/Core/Constant/ScreenSize.dart';
import 'package:ecommerce/Core/Constant/apiLinks.dart';
import 'package:ecommerce/Core/classes/HandilingData.dart';
import 'package:ecommerce/controller/Favorite/FavoriteController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widget/custom_app_bar.dart';
import 'FavoriteBody.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteImplement());
    return Scaffold(
      appBar: customAppBar(context, "Favorite", false),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 30,
            width: double.infinity,
          ),
          const SizedBox(
            height: 20,
            width: double.infinity,
          ),
          GetBuilder<FavoriteImplement>(
              builder: (controller) => HandilingDataView(
                    statusRequest: controller.statusRequest!,
                    widget: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.favoriteDataList.length,
                      itemBuilder: ((context, index) => FavoriteBody(
                            iamge:
                                "${AppLinks.itemsImageLink}/${controller.favoriteDataList[index].itemImage!}",
                            name: controller.favoriteDataList[index].itemName!,
                            rate:
                                "${controller.favoriteDataList[index].itemRate}",
                            price:
                                controller.favoriteDataList[index].itemPrice!,
                            onDelete: () {
                              controller.deleteFavoriteData(controller
                                  .favoriteDataList[index].favoriteId!);
                            },
                            onDismissed: (dismissDirection) {
                              controller.deleteFavoriteData(controller
                                  .favoriteDataList[index].favoriteId!);
                            },
                          )),
                    ),
                  ))
        ],
      )),
    );
  }
}

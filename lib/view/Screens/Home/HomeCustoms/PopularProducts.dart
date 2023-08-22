import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Core/Constant/apiLinks.dart';
import 'package:ecommerce/controller/Home/HomeController.dart';
import 'package:ecommerce/data/model/Home/Items/ItemsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Constant/Colors.dart';
import '../../../../Core/Constant/ScreenSize.dart';
import '../../../../Core/classes/notifications.dart';

class PopularProductsObject extends GetView<HomeControllerImplement> {
  const PopularProductsObject({
    Key? key,
    required this.itemsModel,
  }) : super(key: key);
  final ItemsModel itemsModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToDetails(itemsModel);
      },
      child: Container(
        height: 100,
        width: AppSize.screenWidth / 2.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColor.lightGrey,
        ),
        child: Hero(
          tag: itemsModel.itemId!,
          child: CachedNetworkImage(
              imageUrl: "${AppLinks.itemsImageLink}/${itemsModel.itemImage!}",
              fit: BoxFit.contain),
        ),
      ),
    );
  }
}

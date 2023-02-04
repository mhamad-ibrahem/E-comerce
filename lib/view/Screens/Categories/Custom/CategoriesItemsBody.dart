import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/data/model/Home/Items/ItemsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Constant/Colors.dart';
import '../../../../Core/Constant/ScreenSize.dart';
import '../../../../Core/Constant/apiLinks.dart';
import '../../../../controller/Categories/CategoriesController.dart';

class CategoriesItemBody extends GetView<CategoriesControllerImplement> {
  CategoriesItemBody({super.key, required this.itemsModel});
  ItemsModel itemsModel;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1/2,
      child: GestureDetector(
        onTap: () {
          controller.goToDetails(itemsModel);
        },
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 5,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          color: AppColor.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 140,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  color: AppColor.lightGrey,
                ),
                width: AppSize.screenWidth,
                child: Hero(
                  tag: itemsModel.itemId!,
                  child: CachedNetworkImage(
                      imageUrl:
                          "${AppLinks.itemsImageLink}/${itemsModel.itemImage}"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itemsModel.itemName!,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Discount : ${itemsModel.itemDiscount!} %',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${itemsModel.itemPrice} \$",
                              style: const TextStyle(
                                  color: AppColor.deepOrange,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600)),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Icon(
                                    Icons.star,
                                    color: AppColor.yellow,
                                  ),
                                ),
                                Text(itemsModel.itemRate!,
                                    style: Theme.of(context).textTheme.headline2),
                              ],
                            ),
                          )
                        ]),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Constant/Colors.dart';
import '../../../../controller/Auth/Details/DetailesController.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailesControllerImplement>(
      builder: (controller) =>
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: RatingBar.builder(
              initialRating: controller.itemRating!,
              itemSize: 32,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
              itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: AppColor.yellow,
                  ),
              onRatingUpdate: (rate) => controller.changeRating(rate)),
        ),
        InkWell(
                  onTap: () {
                  controller.addTofavorite();
                  },
                  child: Container(
                    height: 50,
                    width: 70,
                    decoration: BoxDecoration(
                      color:controller.itemsModel.isFavorite =='1'
                              ? AppColor.lightPink
                              : AppColor.lightGrey,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          bottomLeft: Radius.circular(40)),
                    ),
                    child: Icon(
                      Icons.favorite,
                      color:controller.itemsModel.isFavorite =='1'
                              ? AppColor.red
                              : AppColor.deepGrey,
                    ),
                  ),
                )
      ]),
    );
  }
}

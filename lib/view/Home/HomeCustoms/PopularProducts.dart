import 'package:ecommerce/controller/HomePageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constant/Colors.dart';

class PopularProductsListView extends StatelessWidget {
  PopularProductsListView({
    Key? key,
  }) : super(key: key);
  final HomePageController _homePageController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: double.infinity,
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return Row(
            children: [
              PopularProductsObject(
                image: _homePageController.popularProduct[i].image,
                onTap: () => _homePageController.productDetailes(i),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          );
        },
      ),
    );
  }
}

class PopularProductsObject extends StatelessWidget {
  const PopularProductsObject({
    Key? key,
    required this.image,
    required this.onTap,
  }) : super(key: key);
  final String image;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width / 2.5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: lightGrey,
            image: DecorationImage(image: AssetImage(image))),
      ),
    );
  }
}

import 'package:ecommerce/controller/HomePageController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'HomeCustoms/Banner.dart';
import 'HomeCustoms/BrandsListView.dart';
import 'HomeCustoms/CategoriesBar.dart';
import 'HomeCustoms/HomePageHeaders.dart';
import 'HomeCustoms/PopularProducts.dart';
import 'HomeCustoms/SpecialPlusPopular.dart';

class HomePage extends GetView {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),

            //Top Bar

            const HomePageHeaders(),
            const SizedBox(
              height: 30,
            ),

            //CashBack

            const BannerContainer(),
            const SizedBox(
              height: 20,
            ),
            const CategoriesBar(),

            //Special for you Text

            const SpecialPlusPopular(
              blackText: 'Special for you',
            ),
            const SizedBox(
              height: 10,
            ),
            //Brands
            const BrandsListView(),

            //Popular Product upper Text

            const SpecialPlusPopular(blackText: 'Popular Product'),
            const SizedBox(
              height: 10,
            ),

            //Popular Product List

            PopularProductsListView()
          ],
        ),
      ),
    );
  }
}

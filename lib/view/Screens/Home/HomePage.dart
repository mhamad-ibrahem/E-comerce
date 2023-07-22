import 'package:ecommerce/Core/Constant/Colors.dart';
import 'package:ecommerce/Core/classes/HandilingData.dart';
import 'package:ecommerce/controller/Home/HomeController.dart';
import 'package:ecommerce/data/model/Home/Items/ItemsModel.dart';
import 'package:ecommerce/view/Screens/Home/HomeCustoms/HomeCategories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'HomeCustoms/Banner.dart';
import 'HomeCustoms/BrandsListView.dart';
import 'HomeCustoms/HomePageHeaders.dart';
import 'HomeCustoms/ItemSearchProduct.dart';
import 'HomeCustoms/PopularProducts.dart';
import 'HomeCustoms/SpecialPlusPopular.dart';

class HomePage extends GetView<HomeControllerImplement> {
  const HomePage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImplement());
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),

          //Top Bar

          HomePageHeaders(
              onChanged: (val) {
                controller.checkSearch(val);
              },
              onSearch: () {
                controller.onSearchItem();
              },
              search: controller.search),

          const SizedBox(
            height: 30,
          ),
          GetBuilder<HomeControllerImplement>(
            builder: (controller) => HandilingDataView(
              statusRequest: controller.statusRequest!,
              onPressed: () async {
                await controller.getData();
              },
              widget: controller.isSearch == false
                  ? Column(
                      children: [
                        const BannerContainer(),
                        const SizedBox(
                          height: 20,
                        ),
                        const HomeCategories(),

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

                        GetBuilder<HomeControllerImplement>(
                          builder: (controller) => SizedBox(
                            height: 120,
                            width: double.infinity,
                            child: ListView.builder(
                              itemCount: controller.popularItems.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, i) {
                                return Row(
                                  children: [
                                    PopularProductsObject(
                                      itemsModel: ItemsModel.fromJson(
                                          controller.popularItems[i]),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    )
                  : ItemSearchProduct(
                      listItemModel: controller.searchItem,
                    ),
            ),
          ),
        ]),
      ),
    ));
  }
}

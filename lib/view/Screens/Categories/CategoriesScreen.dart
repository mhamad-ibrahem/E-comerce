import 'package:ecommerce/Core/Constant/Colors.dart';
import 'package:ecommerce/Core/Constant/ScreenSize.dart';
import 'package:ecommerce/Core/classes/HandilingData.dart';
import 'package:ecommerce/controller/Categories/CategoriesController.dart';
import 'package:ecommerce/data/model/Home/Categories/CategoriesModel.dart';
import 'package:ecommerce/data/model/Home/Items/ItemsModel.dart';
import 'package:ecommerce/view/Screens/Categories/Custom/CategoriesItemsBody.dart';
import 'package:ecommerce/view/Screens/Categories/Custom/CategoriesNameBody.dart';
import 'package:ecommerce/view/Screens/Home/HomeCustoms/HomePageHeaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreen extends GetView<CategoriesControllerImplement> {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesControllerImplement());
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<CategoriesControllerImplement>(
          builder: (controller) => Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomePageHeaders(),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: AppSize.screenWidth,
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.categories!.length,
                      itemBuilder: (context, i) => CategoriesNameBody(
                          categoriesModel: CategoriesModel.fromJson(
                              controller.categories![i]),
                          selectedCat: i),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  HandilingDataView(
                      statusRequest:controller.statusRequest!,
                      widget: GridView.builder(
                        itemCount: controller.itemsList.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 5.7 / 8,
                        ),
                        itemBuilder: (context, index) => CategoriesItemBody(
                          itemsModel:
                              ItemsModel.fromJson(controller.itemsList[index]),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

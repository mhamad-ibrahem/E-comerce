
import 'package:ecommerce/controller/Home/HomeController.dart';
import 'package:ecommerce/data/model/Home/Categories/CategoriesModel.dart';
import 'package:ecommerce/view/Screens/Home/HomeCustoms/CategoriesBody.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCategories extends GetView<HomeControllerImplement> {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImplement>(
        builder: (controller) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.categoriesList.length,
                      itemBuilder: ((context, index) => CategoriesBody(
                            categoriesModel: CategoriesModel.fromJson(
                                controller.categoriesList[index]), i: index,
                          ))),
                ),
              ],
            ));
  }
}

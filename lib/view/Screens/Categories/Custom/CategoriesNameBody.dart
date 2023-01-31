import 'package:ecommerce/controller/Categories/CategoriesController.dart';
import 'package:ecommerce/data/model/Home/Categories/CategoriesModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Constant/Colors.dart';

class CategoriesNameBody extends GetView<CategoriesControllerImplement> {
  const CategoriesNameBody(
      {super.key, required this.categoriesModel, required this.selectedCat});
  final CategoriesModel categoriesModel;
  final int? selectedCat;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoriesControllerImplement>(
      builder: (controller) => Container(
        margin:const EdgeInsets.only(left:20),
        decoration: controller.selectedCategory == selectedCat
            ? const BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: AppColor.deepOrange, width: 5)))
            : null,
        child: GestureDetector(
          onTap: () => controller.changeSelectedCategory(
              selectedCat!, categoriesModel.categoriesId!),
          child: Text(
            categoriesModel.categoriesName!,
            style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 22),
          ),
        ),
      ),
    );
  }
}

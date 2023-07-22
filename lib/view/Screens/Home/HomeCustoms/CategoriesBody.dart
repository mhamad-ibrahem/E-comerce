import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/Home/HomeController.dart';
import 'package:ecommerce/data/model/Home/Categories/CategoriesModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Constant/Colors.dart';
import '../../../../Core/Constant/apiLinks.dart';

class CategoriesBody extends GetView<HomeControllerImplement> {
  const CategoriesBody(
      {super.key, required this.categoriesModel, required this.i});
  final CategoriesModel categoriesModel;
  final int i;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.goToCategoriesPage(
            controller.categoriesList, i, categoriesModel.categoriesId!);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: 70,
              width: 70,
              margin: const EdgeInsets.only(right: 15),
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColor.pink),
              child: CachedNetworkImage(
                placeholder: (context, url) => const Center(
                    child:
                        CircularProgressIndicator(color: AppColor.deepOrange)),
                errorWidget: (context, url, error) => Text(
                  "Check Internet",
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: AppColor.deepOrange),
                ),
                imageUrl:
                    "${AppLinks.categoriesImageLink}/${categoriesModel.categoriesImage}",
                fit: BoxFit.contain,
              )),
          const SizedBox(
            height: 10,
          ),
          Text('${categoriesModel.categoriesName}',
              style: Theme.of(context).textTheme.headline2),
        ],
      ),
    );
  }
}

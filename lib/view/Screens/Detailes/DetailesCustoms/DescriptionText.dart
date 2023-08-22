import 'package:ecommerce/Core/Constant/Colors.dart';
import 'package:ecommerce/Core/Constant/ScreenSize.dart';
import 'package:ecommerce/Core/classes/deep_link_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/Details/DetailesController.dart';
import 'MoreDetail.dart';

class DescriptionText extends GetView<DetailesControllerImplement> {
  const DescriptionText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.only(left: 25, right: 25, bottom: 30, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Descriprion :",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: AppColor.black)),
            const SizedBox(
              height: 10,
            ),
            GetBuilder<DetailesControllerImplement>(
              builder: (controller) => Text(
                controller.itemsModel.itemDescriprion!,
                maxLines: controller.isReadmore ? null : 2,
                style: Theme.of(context).textTheme.headline1,
                overflow: controller.isReadmore
                    ? TextOverflow.visible
                    : TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const MoreDetail(),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Price :  ",
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontSize: 17),
                ),
                Text(
                  "${controller.itemsModel.itemfinalPrice!} \$",
                  style: const TextStyle(
                      fontSize: 17,
                      color: AppColor.orange,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Categories : ${controller.itemsModel.categoriesName!}",
              maxLines: 2,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: AppColor.deepGrey),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                DeepLinkSevice.shareProduct(
                    int.parse(controller.itemsModel.itemId!));
              },
              child: const Icon(
                Icons.share,
                color: AppColor.orange,
              ),
            )
          ],
        ));
  }
}

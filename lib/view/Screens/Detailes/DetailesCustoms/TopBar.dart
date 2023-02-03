import 'package:ecommerce/controller/Auth/Details/DetailesController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Constant/Colors.dart';


class TopBar extends GetView<DetailesControllerImplement> {
  const TopBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back),
          color: AppColor.black,
        ),
        const SizedBox(
          width: 100,
        ),
        Row(
          children: [
            Text(
              '${controller.itemsModel.itemRate}',
              style: const TextStyle(
                  color: AppColor.black,
                  fontSize: 15,
                  fontFamily: 'muli',
                  fontWeight: FontWeight.bold),
            ),
            const Icon(
              Icons.star_rounded,
              color:AppColor. yellow,
            )
          ],
        )
      ],
    );
  }
}

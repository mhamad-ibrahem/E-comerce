import 'package:ecommerce/Core/Constant/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Constant/Colors.dart';
import '../../../../Core/Constant/ScreenSize.dart';
import '../../../../controller/DetailesController.dart';

class ColorsAndQuntityContainer extends StatelessWidget {
  const ColorsAndQuntityContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailesControllerImplement>(
      builder: (controller) => Container(
          height: 74,
          width: AppSize.screenWidth - 20,
          decoration: BoxDecoration(
              color: AppColor.veryLightGrey,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...List.generate(
                  controller.itemColor.length,
                  (index) => GestureDetector(
                        onTap: () {
                          controller.changeColor(controller.itemColor[index]);
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: controller.itemColor[index],
                              shape: BoxShape.circle,
                              border: controller.activeColor ==
                                      controller.itemColor[index]
                                  ? Border.all(
                                      color: AppColor.black, width: 2)
                                  : null),
                        ),
                      )),
              Row(
                children: [
                  IconButton(
                      onPressed: () => controller.decreaseQuantity(),
                      icon: const Icon(
                        Icons.remove,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${controller.itemsModel.itemQuantity}',
                    style: blackTextStyle(),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () => controller.increaseQuantity(),
                    icon: const Icon(Icons.add),
                  )
                ],
              ), 
            ],
          )),
    );
  }
}

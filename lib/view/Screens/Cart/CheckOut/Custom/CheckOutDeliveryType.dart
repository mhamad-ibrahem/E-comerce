import 'package:ecommerce/Core/Constant/Colors.dart';
import 'package:ecommerce/controller/CheckOut/CheckOutController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutDeliveryType extends StatelessWidget {
  const CheckOutDeliveryType({
    super.key,
    required this.method,
    required this.image,
  });
  final String method;
  final String image;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutController>(
      builder: (controller) => MaterialButton(
          onPressed: () => controller.chooseDeliveryMethod(method, context),
          height: 189,
          minWidth: 130,
          color: controller.dilveryMethod == method ? null : AppColor.pink,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: controller.dilveryMethod == method
                  ? const BorderSide(color: AppColor.orange)
                  : BorderSide.none),
          child: Column(
            children: [
              Image.asset(
                image,
                height: 130,
                width: 130,
                color:
                    controller.dilveryMethod == method ? null : AppColor.white,
              ),
              Text(
                method,
                style: controller.dilveryMethod == method
                    ? Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: AppColor.orange)
                    : Theme.of(context).textTheme.headline5,
              ),
            ],
          )),
    );
  }
}

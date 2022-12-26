import 'package:ecommerce/Core/Constant/Colors.dart';
import 'package:ecommerce/Core/classes/handilingData.dart';
import 'package:ecommerce/controller/testController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      body: GetBuilder<TestController>(builder: (controller) {
        return HandilingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: ((context, index) => Text(
                      '${controller.data}',
                      style: const TextStyle(
                          fontSize: 20, color: AppColor.black),
                    ))));
      }),
    );
  }
}

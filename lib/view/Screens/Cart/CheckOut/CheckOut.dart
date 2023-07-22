import 'package:ecommerce/Core/Constant/Colors.dart';
import 'package:ecommerce/Core/Constant/ScreenSize.dart';
import 'package:ecommerce/Core/Constant/imageAsset.dart';
import 'package:ecommerce/Core/classes/HandilingData.dart';
import 'package:ecommerce/controller/CheckOut/CheckOutController.dart';
import 'package:ecommerce/view/Widget/CustomButton.dart';
import 'package:ecommerce/view/Widget/custom_app_bar.dart';
import 'package:ecommerce/view/shared/ChectOut/paymentMethod.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Custom/CheckOutDeliveryType.dart';

class CheckOutScreen extends StatelessWidget {
  CheckOutScreen({super.key});
  final CheckOutController controller = Get.put(CheckOutController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context, "Checkout", true),
        body: GetBuilder<CheckOutController>(
          builder: (controller) => HandilingDataView(
            statusRequest: controller.statusRequest,
            widget: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text("Choose Payment Method",
                            style: Theme.of(context).textTheme.caption!),
                        PaymentMethod(
                          paymentTitle: "Cash",
                          onTap: () {
                            controller.choosePayemntMethod("Cash");
                          },
                          isActive:
                              controller.paymentMethod == 'Cash' ? true : false,
                        ),
                        PaymentMethod(
                          paymentTitle: "Credit Card",
                          onTap: () {
                            controller.choosePayemntMethod("Credit Card");
                          },
                          isActive: controller.paymentMethod == 'Credit Card'
                              ? true
                              : false,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Choose Delivery Type",
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(color: AppColor.orange),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CheckOutDeliveryType(
                                image: AppImageAsset.deliveryImage,
                                method: "Delivery"),
                            CheckOutDeliveryType(
                                method: "Drive Through",
                                image: AppImageAsset.driveThruImage)
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Visibility(
                          visible: controller.isDelivery,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Choose Shipeining Address",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(color: AppColor.orange),
                              ),
                              SizedBox(
                                height: AppSize.screenHight * 0.3,
                                width: AppSize.screenWidth,
                                child: ListView.separated(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: const EdgeInsets.only(top: 20),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                          height: 20,
                                        ),
                                    itemBuilder: (context, index) =>
                                        MaterialButton(
                                            onPressed: () =>
                                                controller.chooseAddress(index),
                                            height: 75,
                                            padding: EdgeInsets.zero,
                                            color: controller.selectedAddress ==
                                                    index
                                                ? AppColor.orange
                                                : AppColor.grey,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  right: AppSize.screenWidth /
                                                      2.5),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    controller
                                                        .addressList[index]
                                                        .addressName,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline5,
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    controller
                                                        .addressList[index]
                                                        .addressCity,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline5,
                                                  ),
                                                ],
                                              ),
                                            )),
                                    itemCount: controller.addressList.length),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                      buttonBody: "Place order",
                      onTap: controller.canPlaceOrder
                          ? () => controller.placeOrder()
                          : null,
                      buttonWidth: AppSize.screenWidth),
                ],
              ),
            ),
          ),
        ));
  }
}

import 'package:ecommerce/Core/Constant/Colors.dart';
import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/Core/classes/HandilingData.dart';
import 'package:ecommerce/controller/Profile/orders/orderController.dart';
import 'package:ecommerce/view/Widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "Orders", true),
      body: GetBuilder<OrderController>(
        builder: (controller) => HandilingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView.separated(
            itemCount: controller.ordersList.length,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
            itemBuilder: (context, index) => Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order Number: #${controller.ordersList[index].ordersId}",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                        "Order Type: ${controller.ordersList[index].orderType}",
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: 14, fontWeight: FontWeight.normal)),
                    Text(
                        "Order Price: ${controller.ordersList[index].ordersPrice} \$",
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: 14, fontWeight: FontWeight.normal)),
                    Text("Delivery Price: 20 \$",
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: 14, fontWeight: FontWeight.normal)),
                    Text(
                        "Payment Method: ${controller.ordersList[index].ordersPaymentType}",
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: 14, fontWeight: FontWeight.normal)),
                    Text(
                        "Order Status: ${controller.orderStatus[int.parse(controller.ordersList[index].ordersStatus!)]}",
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: 14, fontWeight: FontWeight.normal)),
                    const Divider(
                      color: AppColor.grey,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Price: ${double.parse(controller.ordersList[index].ordersPrice!) + 20} \$",
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontSize: 18),
                        ),
                        MaterialButton(
                          onPressed: () => Get.toNamed(AppRoute.orderDetails),
                          color: AppColor.pink,
                          child: Text(
                            "Details",
                            style: Theme.of(context).textTheme.caption,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

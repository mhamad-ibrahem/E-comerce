import 'package:ecommerce/Core/Constant/apiLinks.dart';
import 'package:ecommerce/Core/classes/HandilingData.dart';
import 'package:ecommerce/view/Screens/Cart/CartCustoms/CartBody.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Core/Constant/ScreenSize.dart';
import '../../../controller/Cart/CartController.dart';
import '../../Widget/custom_app_bar.dart';
import 'CartCustoms/BottomSizedBox.dart';

class Cart extends StatelessWidget {
  Cart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return SafeArea(
        child: Scaffold(
            appBar: customAppBar(context, "Cart", true),
            body: GetBuilder<CartController>(
              builder: (controller) => HandilingDataView(
                statusRequest: controller.statusRequest,
                onPressed: () {
                  controller.getData();
                },
                widget: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(children: [
                            SizedBox(
                              height: AppSize.screenHight * 0.6,
                              child: ListView.separated(
                                separatorBuilder: ((context, index) =>
                                    const SizedBox(
                                      height: 20,
                                    )),
                                itemCount: controller.cartDataList.length,
                                itemBuilder: (context, index) => CartBody(
                                  image:
                                      "${AppLinks.itemsImageLink}/${controller.cartDataList[index].itemImage}",
                                  price:
                                      controller.cartDataList[index].itemPrice!,
                                  quantity: controller
                                      .cartDataList[index].countItems!,
                                  title:
                                      controller.cartDataList[index].itemName!,
                                  onDecrease: () async {
                                    await controller.removeFromCart(
                                        controller.cartDataList[index].itemId!);
                                    controller.refreshView();
                                  },
                                  onIncrease: () async {
                                    await controller.addToCart(
                                        controller.cartDataList[index].itemId!);
                                    controller.refreshView();
                                  },
                                  categoty: 'phone',
                                ),
                              ),
                            ),
                            const BottomSizedBox(),
                          ]),
                        ]),
                  ),
                ),
              ),
            )));
  }
}

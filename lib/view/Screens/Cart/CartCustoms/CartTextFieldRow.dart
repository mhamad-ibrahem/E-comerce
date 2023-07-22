import 'package:ecommerce/controller/Cart/CartController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Core/Constant/Colors.dart';
import '../../../../Core/Constant/ScreenSize.dart';

class CartTextFieldRow extends GetView<CartController> {
  const CartTextFieldRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.receipt,
              color: AppColor.orange,
            ),
            const SizedBox(
              width: 20,
            ),
            Text("${controller.discountCoupon}\$",
                style: const TextStyle(
                    color: AppColor.black,
                    fontSize: 15,
                    fontFamily: 'muli',
                    fontWeight: FontWeight.bold)),
          ],
        ),
        controller.couponName == null
            ? Container(
                height: 40,
                width: AppSize.screenWidth / 1.8,
                decoration: BoxDecoration(
                    color: AppColor.lightGrey,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: TextFormField(
                    controller: controller.coupon,
                    style: const TextStyle(
                        color: AppColor.black,
                        fontSize: 15,
                        fontFamily: 'muli',
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15),
                      fillColor: AppColor.black,
                      hintText: '   Add Coupon code',
                      hintStyle: Theme.of(context).textTheme.headline6,
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: AppColor.deepGrey,
                        ),
                        onPressed: () {
                          controller.checkCoupon();
                        },
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              )
            : Center(
                child: Text("${controller.couponName}"),
              )
      ],
    );
  }
}

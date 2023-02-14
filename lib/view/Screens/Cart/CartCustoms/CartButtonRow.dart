import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Core/Constant/ScreenSize.dart';
import '../../../../Core/Theme/Themes.dart';
import '../../../../Core/Constant/fonts.dart';
import '../../../../controller/Cart/CartController.dart';
import '../../../Widget/CustomButton.dart';

class CartButtonRow extends StatelessWidget {
  const CartButtonRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<CartController>(
          builder:(controller)=>Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Total\n',
                  style: smallGreyTextStyle(),
                ),
                TextSpan(
                    text: '\$ ${controller.totalPrice}',
                    style: Themes().currentTheme.textTheme.headline1),
              ],
            ),
          ),
          CustomButton(
            onTap: () {},
            buttonBody: 'Check Out',
          buttonWidth: AppSize.screenWidth * 0.55
          )
        ],
      ),
    );
  }
}

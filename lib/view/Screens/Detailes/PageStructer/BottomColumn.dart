
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Constant/Colors.dart';
import '../../../../Core/Constant/ScreenSize.dart';
import '../../../../controller/Details/DetailesController.dart';
import '../../../Widget/CustomButton.dart';
import '../DetailesCustoms/ColorsAndQuntity.dart';
import '../DetailesCustoms/DescriptionText.dart';
import '../DetailesCustoms/FavouriteButton.dart';

class BottomColumn extends GetView<DetailesControllerImplement> {
  const BottomColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.lightGrey,
      child: Container(
        padding: const EdgeInsets.only(top: 20),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            color: AppColor.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Product Name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Text(controller.itemsModel.itemName!,
                  style: Theme.of(context).textTheme.headline3!.copyWith(color: AppColor.black)),
            ),
            //Add to Favourite Button
            const FavouriteButton(),
            //Description of The Product
            const DescriptionText(),
            //The Colors And plus-minus Row
            const Center(child: ColorsAndQuntityContainer()),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: CustomButton(
                onTap: () {
                  controller.goToCart();
                },
                buttonBody: 'Go to cart',
                buttonWidth: AppSize.screenWidth * 0.75,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

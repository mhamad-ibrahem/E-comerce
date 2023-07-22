import 'package:ecommerce/Core/Constant/ScreenSize.dart';
import 'package:ecommerce/Core/classes/HandilingData.dart';
import 'package:ecommerce/Core/functions/Validation.dart';
import 'package:ecommerce/controller/Profile/Addrees/addressDetails.dart';
import 'package:ecommerce/view/Widget/CustomAppPage.dart';
import 'package:ecommerce/view/Widget/CustomButton.dart';
import 'package:ecommerce/view/Widget/CustomTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WriteLocationScreen extends GetView<AddreesDetailsImplement> {
  const WriteLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddreesDetailsImplement());
    return CustomAppPage(
        isScroll: true,
        title: "Add Location",
        backArrowVisiablity: true,
        body: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            GetBuilder<AddreesDetailsImplement>(
                builder: (controller) => HandilingDataView(
                    statusRequest: controller.statusRequest!,
                    widget: Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
                            CustomTextFormField(
                              icon: Icons.location_on_outlined,
                              label: "Name",
                              hint: "Enter address name",
                              obscure: false,
                              textEditingController: controller.name!,
                              validator: (val) {
                                return validation(val!, 3, 30, "name");
                              },
                              suffixIcon: null,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            CustomTextFormField(
                              icon: Icons.location_city,
                              label: "City",
                              hint: "Enter your city name",
                              obscure: false,
                              textEditingController: controller.city!,
                              validator: (val) {
                                return validation(val!, 3, 30, "name");
                              },
                              suffixIcon: null,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            CustomTextFormField(
                              icon: Icons.streetview_rounded,
                              label: "Street",
                              hint: "Enter your street name",
                              obscure: false,
                              textEditingController: controller.street!,
                              validator: (val) {
                                return validation(val!, 3, 30, "name");
                              },
                              suffixIcon: null,
                            ),
                            SizedBox(
                              height: AppSize.screenHight * 0.2,
                            ),
                            CustomButton(
                                buttonBody: "Finish",
                                onTap: () {
                                  controller.addAdress();
                                },
                                buttonWidth: AppSize.screenWidth * 0.9),
                          ],
                        ))))
          ],
        ));
  }
}

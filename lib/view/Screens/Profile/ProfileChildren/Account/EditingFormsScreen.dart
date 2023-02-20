import 'dart:io';

import 'package:ecommerce/Core/Constant/ScreenSize.dart';
import 'package:ecommerce/controller/Profile/account/AccountController.dart';
import 'package:ecommerce/view/Widget/CustomTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditingFormsScreen extends GetView<AccountImplement> {
  const EditingFormsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: AppSize.screenWidth,
        height: AppSize.screenHight * 0.36,
        child: ListView(
          children: [
            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                      icon: Icons.person,
                      label: "user name",
                      hint: "change user name",
                      obscure: false,
                      textEditingController: controller.userName,
                      validator: (val) {},
                      suffixIcon: null),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                      icon: Icons.person,
                      label: "email",
                      hint: "change your email",
                      obscure: false,
                      textEditingController: controller.email,
                      validator: (val) {},
                      suffixIcon: null),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                      icon: Icons.person,
                      label: "password",
                      hint: "change your password",
                      obscure: false,
                      textEditingController: controller.password,
                      validator: (val) {},
                      suffixIcon: null),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                      icon: Icons.person,
                      label: "number",
                      hint: "change your number",
                      obscure: false,
                      textEditingController: controller.number,
                      validator: (val) {},
                      suffixIcon: null),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                      icon: Icons.person,
                      label: "location",
                      hint: "change your location",
                      obscure: false,
                      textEditingController: controller.location,
                      validator: (val) {},
                      suffixIcon: null),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
          ],
        ));
  }
}

import 'package:ecommerce/view/Widget/CustomTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Core/functions/Validation.dart';
import '../../../../../controller/Profile/ProfileController.dart';

class EditingFormsScreen extends GetView<ProfileImplement> {
  const EditingFormsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
              icon: Icons.person,
              label: "user name",
              hint: controller.userName.text,
              obscure: false,
              textEditingController: controller.userName,
              validator: (val) {
                return validation(val!, 1, 500, '');
              },
              suffixIcon: null),
          const SizedBox(
            height: 30,
          ),
          CustomTextFormField(
              icon: Icons.person,
              label: "email",
              hint: controller.email.text,
              obscure: false,
              textEditingController: controller.email,
              validator: (val) {
                return validation(val!, 1, 500, 'email');
              },
              suffixIcon: null),
          const SizedBox(
            height: 30,
          ),
          CustomTextFormField(
              icon: Icons.person,
              label: "password",
              hint: "*********",
              obscure: false,
              textEditingController: controller.password,
              validator: (val) {
                return validation(val!, 8, 100, '');
              },
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
              validator: (val) {
                return validation(val!, 10, 10, 'Number');
              },
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
              validator: (val) {
                return validation(val!, 1, 500, '');
              },
              suffixIcon: null),
        ],
      ),
    );
  }
}

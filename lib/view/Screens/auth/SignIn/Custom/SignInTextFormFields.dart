import 'package:ecommerce/Core/Constant/Colors.dart';
import 'package:ecommerce/Core/functions/Validation.dart';
import 'package:ecommerce/controller/Auth/SignIn/SignInController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Widget/CustomTextFormField.dart';

class SignInTextFormFields extends StatelessWidget {
  const SignInTextFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInImplement>(
        builder: (controller) => Column(
              children: [
                CustomTextFormField(
                    icon: Icons.email_outlined,
                    hint: 'Enter your email',
                    label: '  Email  ',
                    inputType: TextInputType.emailAddress,
                    obscure: false,
                    textEditingController: controller.signinEmail,
                    suffixIcon: null,
                    validator: (value) {
                      return validation(value!, 14, 60, 'email');
                    }),
                const SizedBox(height: 30),
                CustomTextFormField(
                    icon: Icons.lock_outline,
                    label: '  Password  ',
                    hint: 'Enter Your Password',
                    inputType: TextInputType.visiblePassword,
                    obscure: controller.obscureVisability,
                    textEditingController: controller.signinpassword,
                    suffixIcon: IconButton(
                      icon: controller.obscureVisability == false
                          ? const Icon(
                              Icons.visibility,
                              color: AppColor.orange,
                            )
                          : const Icon(Icons.visibility_off_rounded,
                              color: AppColor.orange),
                      onPressed: () {
                        controller.changeObscure();
                      },
                    ),
                    validator: (value) {
                      return validation(value!, 6, 20, '');
                    }),
              ],
            ));
  }
}

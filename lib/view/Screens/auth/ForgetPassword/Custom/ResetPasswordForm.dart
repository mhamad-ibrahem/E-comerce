import 'package:ecommerce/Core/Constant/Colors.dart';
import 'package:ecommerce/controller/Auth/ForgetPassword/ResetPasswordController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Core/functions/Validation.dart';
import '../../../../Widget/CustomTextFormField.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResetPasswordImplement>(
      builder:((controller) =>  Column(
        children: [
          CustomTextFormField(
              icon: Icons.lock_outline,
              label: '  Password  ',
              hint: 'Enter Your Password',
              inputType: TextInputType.visiblePassword,
              obscure: controller.obscureVisability,
              textEditingController: controller.password,
              suffixIcon: IconButton(
                icon: controller.obscureVisability == false
                          ? const Icon(
                              Icons.visibility,
                              color: AppColor.orange,
                            )
                          : const Icon(Icons.visibility_off_rounded,
                              color: AppColor.orange),
                onPressed: () {
                  controller.changePassswordObscure();
                },
              ),
              validator: (value) {
               return validation(value!, 6, 20, '');
              }),
          const SizedBox(height: 30),
          CustomTextFormField(
              icon: Icons.lock_outline,
              hint: 'confirm password',
              label: '  Re-Enter Password  ',
              obscure: controller.confirmPasswordObscure,
              textEditingController: controller.confirmPassword,
              suffixIcon: IconButton(
                icon: controller.confirmPasswordObscure == false
                          ? const Icon(
                              Icons.visibility,
                              color: AppColor.orange,
                            )
                          : const Icon(Icons.visibility_off_rounded,
                              color: AppColor.orange),
                onPressed: () {
                  controller.changeConfirmPasswordObscure();
                },
              ),
              validator: (value) {
               return confirmValidate( controller.password.text, value!);
              }),
        ],
      )
      )
    );
  }
}

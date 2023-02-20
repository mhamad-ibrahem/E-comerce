import 'package:ecommerce/controller/Auth/SignUp/SignUpController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Core/Constant/Colors.dart';
import '../../../../../Core/functions/Validation.dart';
import '../../../../Widget/CustomTextFormField.dart';

class RegesterationTextFormFieldes extends StatelessWidget {
  const RegesterationTextFormFieldes({super.key});
 
  @override
  Widget build(BuildContext context) {
    
    return GetBuilder<SignUpImplement>(
      builder: (controller) => Column(
        children: [
          CustomTextFormField(
              icon: Icons.email_outlined,
              hint: 'Enter your email',
              label: '  Email  ',
              obscure: false,
              textEditingController: controller.signUpEmail,
              suffixIcon: null,
              validator: (value) {
                return validation(value!, 14, 30, 'email');
              }),
          const SizedBox(
            height: 30,
          ),
          CustomTextFormField(
            icon: Icons.lock_outline,
            label: '  Password  ',
            hint: 'Enter your Password',
            obscure: controller.passwordObscure,
            validator: (value) {
              return validation(value!, 6, 20, '');
            },
            textEditingController: controller.signUppassword,
            suffixIcon: IconButton(
              icon: controller.passwordObscure == false
                  ? const Icon(
                      Icons.visibility,
                      color: AppColor.orange,
                    )
                  : const Icon(Icons.visibility_off_rounded,
                      color: AppColor.orange),
              onPressed: () {
                controller.changeObscurePassword();
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextFormField(
            icon: Icons.lock_outline,
            label: '  Confirm Password  ',
            hint: 'Re-enter Password ',
            obscure: controller.confirmPasswordObscure,
            validator: (value) {
              print(value);
              print(controller.signUppassword.text);
              return confirmValidate( value!,controller.signUppassword.text);
            },
            textEditingController: controller.signUppasswordConfirm,
            suffixIcon: IconButton(
              icon: controller.confirmPasswordObscure == false
                  ? const Icon(
                      Icons.visibility,
                      color: AppColor.orange,
                    )
                  : const Icon(Icons.visibility_off_rounded,
                      color: AppColor.orange),
              onPressed: () {
                controller.changeObscureConfirmPassword();
              },
            ),
          ),
        ],
      ),
    );
  }
}

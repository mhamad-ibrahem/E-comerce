import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/AuthController.dart';
import '../../../../Widget/CustomTextFormField.dart';
import 'ConfirmPasswordForm.dart';

class RegesterationTextFormFieldes extends StatelessWidget {
  const RegesterationTextFormFieldes({
    Key? key,
    required AuthController authController,
  })  : _authController = authController,
        super(key: key);

  final AuthController _authController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          icon: Icons.email_outlined,
          hint: 'Enter your email',
          label: '  Email  ',
          inputType: TextInputType.emailAddress,
          obscure: false,
          errorVal: 'Email',
          vallengthError: 10,
          valreturn: 'Email can\'t be less than 10 characters',
          textEditingController: _authController.signUpEmail,
        ),
        const SizedBox(
          height: 30,
        ),
        CustomTextFormField(
          icon: Icons.lock_outline,
          label: '  Password  ',
          hint: 'Enter your Password',
          inputType: TextInputType.visiblePassword,
          obscure: true,
          errorVal: 'Password',
          vallengthError: 6,
          valreturn: 'Password can\'t be less than 6 characters',
          textEditingController: _authController.signUppassword,
        ),
        const SizedBox(
          height: 30,
        ),
        GetBuilder<AuthController>(
          builder: (controller) => PasswordConfirmFormField(
              originalPassword: _authController.signUppassword.text,
              textEditingController: _authController.signUppasswordConfirm),
        ),
      ],
    );
  }
}

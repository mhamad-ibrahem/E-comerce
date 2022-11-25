import 'package:flutter/material.dart';

import '../../../../../controller/AuthController.dart';
import '../../../../Widget/CustomTextFormField.dart';

class CompleteProfileTextFields extends StatelessWidget {
  const CompleteProfileTextFields({
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
          icon: Icons.person_outline,
          hint: 'Enter your first name',
          label: '  First Name  ',
          inputType: TextInputType.name,
          obscure: false,
          errorVal: 'First Name',
          vallengthError: 2,
          valreturn: 'First Name can\'t be less than 2 characters',
          textEditingController: _authController.fname,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          icon: Icons.person_outline,
          hint: 'Enter your last name',
          label: '  Last Name  ',
          inputType: TextInputType.name,
          obscure: false,
          errorVal: 'Last Name',
          vallengthError: 2,
          valreturn: 'Last Name can\'t be less than 2 characters',
          textEditingController: _authController.lname,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          icon: Icons.phone_android_outlined,
          label: '  phone Number ',
          hint: 'Enter your phone number',
          inputType: TextInputType.number,
          obscure: false,
          errorVal: 'Phone Number',
          vallengthError: 10,
          valreturn: 'Phone Number can\'t be less than 10 characters',
          textEditingController: _authController.phoneNumber,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          icon: Icons.location_on_outlined,
          label: '  Address ',
          hint: 'Enter your address',
          inputType: TextInputType.streetAddress,
          obscure: false,
          errorVal: 'Address',
          vallengthError: 10,
          valreturn: 'Address can\'t be less than 10 characters',
          textEditingController: _authController.address,
        ),
      ],
    );
  }
}

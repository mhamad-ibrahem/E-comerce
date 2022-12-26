import 'package:ecommerce/controller/Auth/SignUp/SignUpController.dart';
import 'package:flutter/material.dart';
import '../../../../../Core/functions/Validation.dart';
import '../../../../Widget/CustomTextFormField.dart';
import 'package:get/get.dart';

class CompleteProfileTextFields extends GetView<SignUpImplement> {
  const CompleteProfileTextFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
            icon: Icons.person_outline,
            hint: 'Enter your name',
            label: ' Name  ',
            inputType: TextInputType.name,
            obscure: false,
            errorVal: ' Name',
            vallengthError: 2,
            valreturn: ' Name can\'t be less than 2 characters',
            textEditingController: controller.name,
            suffixIcon: null,
            validator: (value) {
             return validation(value!, 3, 20, 'userName');
             
            }),
      
        const SizedBox(
          height: 30,
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
            textEditingController: controller.phoneNumber,
            suffixIcon: null,
            validator: (value) {
            return validation(value!, 10, 10, 'Number');
             
            }),
        const SizedBox(
          height: 30,
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
            textEditingController: controller.address,
            suffixIcon: null,
            validator: (value) {
            return  validation(value!, 3, 30, '');
            }),
      ],
    );
  }
}

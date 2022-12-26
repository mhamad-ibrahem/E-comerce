import 'package:flutter/material.dart';
import '../../Core/Constant/Colors.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpInput extends StatelessWidget {
  
   OtpInput({required this.otpFunction});
  Function(String)? otpFunction;

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      numberOfFields: 5,
      borderColor: AppColor.deepGrey,
      focusedBorderColor: AppColor.orange,
      borderRadius: BorderRadius.circular(12),
      fieldWidth: 25,
      keyboardType: TextInputType.number,
      obscureText: false,
      showCursor: false,
      textStyle: const TextStyle(
          color: AppColor.black,
          fontSize: 25,
          fontFamily: 'muli',
          fontWeight: FontWeight.w500),
      // styles: otpTextStyles,
      showFieldAsBox: false,
      borderWidth: 4.0,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      onSubmit: otpFunction
    );
  }
}

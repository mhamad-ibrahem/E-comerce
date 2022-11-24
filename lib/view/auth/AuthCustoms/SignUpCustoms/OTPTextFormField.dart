import 'package:ecommerce/model/Themes.dart';
import 'package:flutter/material.dart';

import '../../../../Constant/Colors.dart';

class OtpInput extends StatelessWidget {
  const OtpInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: TextFormField(
        validator: (val) {
          if (val!.isEmpty) {
            return 'Null';
          }
          // if (val.length < ) {
          //   return valreturn;
          // }
          return null;
        },
        style: Themes().currentTheme.textTheme.headline1,
        autofocus: true,
        obscureText: true,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        cursorColor: deepGrey,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: deepGrey)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          counterText: '',
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}

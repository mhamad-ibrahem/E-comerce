import 'package:flutter/material.dart';
import '../../../../../Core/Constant/Colors.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
        'By continuing you confirm that you agree\nwith our Term and Condition',
        textAlign: TextAlign.center,
        style: TextStyle(
            color:AppColor.deepGrey,
            fontSize: 12,
            fontFamily: 'muli',
            fontWeight: FontWeight.w600));
  }
}

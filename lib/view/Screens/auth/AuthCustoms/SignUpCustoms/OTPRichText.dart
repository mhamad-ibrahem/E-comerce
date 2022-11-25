import 'package:flutter/material.dart';

import '../../../../../Core/Constant/Colors.dart';
import '../../../../../Core/Theme/Themes.dart';

class OtpRichText extends StatelessWidget {
  const OtpRichText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: <TextSpan>[
        TextSpan(
          text:
              'We sent your code to +963 0937386***\nthis code will expired in',
          style: Themes().currentTheme.textTheme.headline1,
        ),
        TextSpan(
          text: ' 00:30',
          style: TextStyle(
              color: pinkred,
              fontSize: 15,
              fontFamily: 'muli',
              fontWeight: FontWeight.w600),
        )
      ]),
    );
  }
}

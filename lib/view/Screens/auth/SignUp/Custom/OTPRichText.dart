import 'package:flutter/material.dart';
import '../../../../../Core/Constant/Colors.dart';


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
              'We sent your code to your email\nthis code will expired in',
          style: Theme.of(context).textTheme.headline1,
        ),
        const TextSpan(
          text: ' 00:30',
          style: TextStyle(
              color:AppColor.pinkred,
              fontSize: 15,
              fontFamily: 'muli',
              fontWeight: FontWeight.w600),
        )
      ]),
    );
  }
}

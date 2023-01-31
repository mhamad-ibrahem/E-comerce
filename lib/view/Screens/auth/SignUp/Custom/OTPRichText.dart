import 'package:flutter/material.dart';
import '../../../../../Core/Constant/Colors.dart';


class OtpRichText extends StatelessWidget {
   const OtpRichText({
    Key? key, required this.time,
  }) : super(key: key);
  final int time; 
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
         TextSpan(
          text: "  00.$time",
          style: const TextStyle(
              color:AppColor.pinkred,
              fontSize: 15,
              fontFamily: 'muli',
              fontWeight: FontWeight.w600),
        )
      ]),
    );
  }
}

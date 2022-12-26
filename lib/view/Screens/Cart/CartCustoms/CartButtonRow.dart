import 'package:flutter/material.dart';

import '../../../../Core/Constant/ScreenSize.dart';
import '../../../../Core/Theme/Themes.dart';
import '../../../../Core/Constant/fonts.dart';
import '../../../Widget/CustomButton.dart';

class CartButtonRow extends StatelessWidget {
  const CartButtonRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: 'Total\n',
                style: smallGreyTextStyle(),
              ),
              TextSpan(
                  text: '\$337.15',
                  style: Themes().currentTheme.textTheme.headline1),
            ],
          ),
        ),
        CustomButton(
          onTap: () {},
          buttonBody: 'Check Out',
          leftPadding: AppSize.screenWidth* 0.2,
          rightPadding: AppSize.screenWidth* 0.2,
        )
      ],
    );
  }
}

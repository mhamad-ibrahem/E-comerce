import 'package:flutter/material.dart';

import '../../../../Core/Theme/Themes.dart';
import '../../../../data/model/functions.dart';
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
            buttonradius: 20,
            containerWidth: MediaQuery.of(context).size.width / 2)
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../Core/Constant/Colors.dart';
import '../../../../Core/Theme/Themes.dart';

class CartTextFieldRow extends StatelessWidget {
  const CartTextFieldRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.receipt,
          color: orange,
        ),
        Container(
          height: 40,
          width: MediaQuery.of(context).size.width / 1.8,
          decoration: BoxDecoration(
              color: lightGrey, borderRadius: BorderRadius.circular(10)),
          child: TextField(
            decoration: InputDecoration(
              hintText: '   Add voucher code',
              hintStyle: Themes().currentTheme.textTheme.headline6,
              suffixIcon: Icon(
                Icons.arrow_forward,
                color: deepGrey,
              ),
              border: InputBorder.none,
            ),
          ),
        )
      ],
    );
  }
}

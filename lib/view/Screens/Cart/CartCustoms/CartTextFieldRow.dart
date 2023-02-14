import 'package:flutter/material.dart';

import '../../../../Core/Constant/Colors.dart';
import '../../../../Core/Constant/ScreenSize.dart';

class CartTextFieldRow extends StatelessWidget {
  const CartTextFieldRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.receipt,
          color: AppColor.orange,
        ),
        Container(
          height: 40,
          width: AppSize.screenWidth / 1.8,
          decoration: BoxDecoration(
              color: AppColor.lightGrey,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: TextField(
              style: const TextStyle(
                  color: AppColor.black,
                  fontSize: 15,
                  fontFamily: 'muli',
                  fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                fillColor: AppColor.black,
                hintText: '   Add voucher code',
                hintStyle: Theme.of(context).textTheme.headline6,
                suffixIcon: const Icon(
                  Icons.arrow_forward,
                  color: AppColor.deepGrey,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        )
      ],
    );
  }
}

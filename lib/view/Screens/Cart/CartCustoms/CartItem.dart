import 'package:flutter/material.dart';

import '../../../../Core/Constant/Colors.dart';
import '../../../../Core/Theme/Themes.dart';
import '../../../../data/model/functions.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.quantity,
  }) : super(key: key);
  final String image;
  final String title;
  final String price;
  final String quantity;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        height: 100,
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 1.7),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: lightPink,
        ),
        child: Icon(
          Icons.delete_outline_outlined,
          color: red,
          size: 30,
        ),
      ),
      key: UniqueKey(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 100,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: lightGrey),
            child: Image.asset(
              image,
              fit: BoxFit.scaleDown,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 2,
                style: smallerBlackTextStyle(),
                overflow: TextOverflow.fade,
              ),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '\n\$$price ',
                      style: Themes().currentTheme.textTheme.caption,
                    ),
                    TextSpan(
                        text: '  x$quantity',
                        style: Themes().currentTheme.textTheme.headline6),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

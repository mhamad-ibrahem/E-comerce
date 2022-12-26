import 'package:ecommerce/Core/Constant/ScreenSize.dart';
import 'package:flutter/material.dart';
import '../../../../Core/Constant/Colors.dart';
import '../../../../Core/Constant/fonts.dart';

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
        padding: EdgeInsets.only(left: AppSize.screenWidth / 1.7),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:AppColor.lightPink,
        ),
        child: const Icon(
          Icons.delete_outline_outlined,
          color: AppColor.red,
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
                borderRadius: BorderRadius.circular(20), color:AppColor. lightGrey),
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
                      style: Theme.of(context).textTheme.caption,
                    ),
                    TextSpan(
                        text: '  x$quantity',
                        style: Theme.of(context).textTheme.headline6),
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

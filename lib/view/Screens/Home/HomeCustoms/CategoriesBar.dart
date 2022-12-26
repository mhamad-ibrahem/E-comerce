import 'package:flutter/material.dart';
import '../../../../Core/Constant/Colors.dart';
import '../../../../Core/Theme/Themes.dart';

class CategoriesBar extends StatelessWidget {
  const CategoriesBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CategoriesBox(
            icon: Icons.flash_on_outlined, onTap: () {}, text: 'Flash\nDeal'),
        CategoriesBox(
          icon: Icons.payment_outlined,
          onTap: () {},
          text: 'Bill',
        ),
        CategoriesBox(
          icon: Icons.gamepad_outlined,
          onTap: () {},
          text: 'Game',
        ),
        CategoriesBox(
          icon: Icons.card_giftcard_outlined,
          onTap: () {},
          text: "Daily\nGift",
        ),
        CategoriesBox(
            icon: Icons.more_horiz_outlined, onTap: () {}, text: 'More'),
      ],
    );
  }
}

class CategoriesBox extends StatelessWidget {
  const CategoriesBox({
    Key? key,
    required this.icon,
    required this.onTap,
    required this.text,
  }) : super(key: key);
  final IconData icon;
  final void Function() onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: AppColor.pink, borderRadius: BorderRadius.circular(10)),
              child: Icon(
                icon,
                color: AppColor.orange,
              ),
            ),
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.headline2,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Core/Constant/Colors.dart';
import '../../Core/Theme/Themes.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: deepGrey,
            )),
        Text(
          title,
          style: Themes().currentTheme.textTheme.headline3,
        ),
        const SizedBox(
          width: 30,
        )
      ],
    );
  }
}

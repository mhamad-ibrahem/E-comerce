import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/Constant/Colors.dart';

customAppBar(BuildContext context, String title, bool isBack) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      title,
      style: Theme.of(context).textTheme.headline3,
    ),
    leading: isBack
        ? IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColor.deepGrey,
            ))
        : null,
  );
}

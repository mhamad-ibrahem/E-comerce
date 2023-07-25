import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Core/Constant/Colors.dart';

openEditBottomSheet(BuildContext context, void Function()? fromGalery,
    void Function()? fromCamera) {
  Get.bottomSheet(
    // backgroundColor: Theme.of(context).primaryColor,
    Container(
      padding: const EdgeInsets.all(20),
      height: 140,
      decoration: const BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      child: Column(
        children: [
          Text(
            "Choose Image",
            style:
                Theme.of(context).textTheme.headline1!.copyWith(fontSize: 17),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: fromGalery,
                  child: Text(
                    "From Galery",
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: AppColor.orange),
                  )),
              TextButton(
                  onPressed: fromCamera,
                  child: Text(
                    "From Camera",
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: AppColor.orange),
                  )),
            ],
          )
        ],
      ),
    ),
  );
}

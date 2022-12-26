import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Core/Constant/Colors.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    Key? key,
    required this.title,@required this.backArrowVisiablity,
  }) : super(key: key);
  final String title;
  final bool? backArrowVisiablity;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
     backArrowVisiablity ==true ?   IconButton(
            onPressed: () {
              Get.back();
            },
            icon:const Icon(
              Icons.arrow_back,
              color:AppColor. deepGrey,
            )): const Text(''),
        Text(
          title,
          style: Theme.of(context).textTheme.headline3,
        ),
        const SizedBox(
          width: 30,
        ) 
      ],
    );
  }
}

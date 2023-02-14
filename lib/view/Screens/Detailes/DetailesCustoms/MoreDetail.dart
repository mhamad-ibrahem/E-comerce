import 'package:ecommerce/controller/Details/DetailesController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Core/Constant/Colors.dart';

class MoreDetail extends StatelessWidget {
  const MoreDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailesControllerImplement>(
      builder: (controller) =>controller.itemsModel.itemDescriprion!.length >80? InkWell(
          onTap: () {
            controller.changeReadMore();
          },
          child: Row(
            children: [
              Text(
               controller.isReadmore ? ' See Less Details' : 'See More Detail ',
                style: Theme.of(context).textTheme.headline1!.copyWith(color: AppColor.deepOrange),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color:AppColor.deepOrange,
                size: 15,
              )
            ],
          )):const SizedBox(),
    );
  }
}

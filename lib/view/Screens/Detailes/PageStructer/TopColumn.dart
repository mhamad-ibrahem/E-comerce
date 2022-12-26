import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Core/Constant/Colors.dart';
import '../../../../Core/Constant/ScreenSize.dart';
import '../../../../controller/DetailesController.dart';
import '../DetailesCustoms/ImagesList.dart';
import '../DetailesCustoms/TopBar.dart';

class TopColumn extends StatelessWidget {
  const TopColumn({
    Key? key,
    required DetailesController detailesController,
  })  : _detailesController = detailesController,
        super(key: key);

  final DetailesController _detailesController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.screenHight / 2.3,
      decoration: const BoxDecoration(color:AppColor. veryLightGrey),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          TopBar(detailesController: _detailesController),
          GetBuilder<DetailesController>(
            builder: (controller) => SizedBox(
                height: 200,
                width: AppSize.screenWidth / 2,
                child: Image.asset(
                  _detailesController
                      .products[0].images[_detailesController.chosenImage],
                )),
          ),
          ImagesList(detailesController: _detailesController),
        ],
      ),
    );
  }
}

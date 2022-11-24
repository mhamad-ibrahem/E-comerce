import 'package:ecommerce/Constant/Colors.dart';
import 'package:ecommerce/controller/DetailesController.dart';
import 'package:ecommerce/model/Themes.dart';
import 'package:ecommerce/view/CutomWidgets/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'DetailesCustoms/DotColors.dart';
import 'PageStructer/BottomColumn.dart';
import 'PageStructer/TopColumn.dart';

class ProductsDetailes extends StatelessWidget {
  ProductsDetailes({Key? key}) : super(key: key);
  final DetailesController _detailesController = Get.put(DetailesController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //The Top Part of The Page
              TopColumn(detailesController: _detailesController),
              //The Bottom Part of The Page
              BottomColumn(detailesController: _detailesController),
            ],
          ),
        ),
      ),
    );
  }
}

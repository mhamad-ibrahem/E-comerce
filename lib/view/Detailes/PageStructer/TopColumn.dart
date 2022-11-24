import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constant/Colors.dart';
import '../../../controller/DetailesController.dart';
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
      height: MediaQuery.of(context).size.height / 2.3,
      decoration: BoxDecoration(color: veryLightGrey),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          TopBar(detailesController: _detailesController),
          GetBuilder<DetailesController>(
            builder: (controller) => SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width / 2,
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

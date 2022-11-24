import 'package:ecommerce/model/functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constant/Colors.dart';
import '../../../controller/DetailesController.dart';

import 'DotsOfColors.dart';

class ColorsAndQuntityContainer extends StatelessWidget {
  const ColorsAndQuntityContainer({
    Key? key,
    required DetailesController detailesController,
  })  : _detailesController = detailesController,
        super(key: key);

  final DetailesController _detailesController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      width: MediaQuery.of(context).size.width - 20,
      decoration: BoxDecoration(
          color: veryLightGrey, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DotsOfColors(detailesController: _detailesController),
          IconButton(
              onPressed: () => _detailesController.decreaseQuantity(),
              icon: const Icon(
                Icons.remove,
              )),
          GetBuilder<DetailesController>(
            builder: (controller) => Text(
              '${_detailesController.quantity}',
              style: blackTextStyle(),
            ),
          ),
          IconButton(
              onPressed: () => _detailesController.increaseQuantity(),
              icon: const Icon(Icons.add))
        ],
      ),
    );
  }
}

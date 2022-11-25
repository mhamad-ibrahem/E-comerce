import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Core/Constant/Colors.dart';
import '../../../../controller/DetailesController.dart';
import 'DotColors.dart';

class DotsOfColors extends StatelessWidget {
  const DotsOfColors({
    Key? key,
    required DetailesController detailesController,
  })  : _detailesController = detailesController,
        super(key: key);

  final DetailesController _detailesController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return GetBuilder<DetailesController>(
            builder: (controller) => Row(
              children: [
                InkWell(
                  onTap: () => _detailesController.changeChosenColor(index),
                  child: Container(
                      decoration: _detailesController.chosenColor == index
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: red))
                          : null,
                      child: DotColors(
                          dotColor: _detailesController.dotcolors[index])),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

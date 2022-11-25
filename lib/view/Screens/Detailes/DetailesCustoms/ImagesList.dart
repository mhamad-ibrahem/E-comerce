import 'package:ecommerce/Core/Constant/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/DetailesController.dart';

class ImagesList extends StatelessWidget {
  const ImagesList({
    Key? key,
    required DetailesController detailesController,
  })  : _detailesController = detailesController,
        super(key: key);

  final DetailesController _detailesController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.3,
      height: 60,
      child: GetBuilder<DetailesController>(
        builder: (controller) => ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: _detailesController.products[0].images.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                InkWell(
                    onTap: () => _detailesController.changeChosenImage(index),
                    child: Container(
                      decoration: _detailesController.chosenImage == index
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: red))
                          : null,
                      height: 60,
                      width: 60,
                      child: Image.asset(
                          _detailesController.products[0].images[index]),
                    )),
                SizedBox(
                  width: 10,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

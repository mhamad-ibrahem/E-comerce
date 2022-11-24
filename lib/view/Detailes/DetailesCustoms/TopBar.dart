import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constant/Colors.dart';
import '../../../controller/DetailesController.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
    required DetailesController detailesController,
  })  : _detailesController = detailesController,
        super(key: key);

  final DetailesController _detailesController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back),
          color: black,
        ),
        const SizedBox(
          width: 100,
        ),
        Row(
          children: [
            Text(
              '${_detailesController.products[0].rate}',
              style: TextStyle(
                  color: black,
                  fontSize: 15,
                  fontFamily: 'muli',
                  fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.star_rounded,
              color: yellow,
            )
          ],
        )
      ],
    );
  }
}

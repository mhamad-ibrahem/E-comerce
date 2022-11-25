import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/DetailesController.dart';
import '../../../../Core/Theme/Themes.dart';

class DescriptionText extends StatelessWidget {
  const DescriptionText({
    Key? key,
    required DetailesController detailesController,
  })  : _detailesController = detailesController,
        super(key: key);

  final DetailesController _detailesController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailesController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.only(left: 40, right: 60),
        child: SizedBox(
          height: _detailesController.height,
          child: Text(
            _detailesController.products[0].description,
            maxLines: _detailesController.maxlines,
            style: Themes().currentTheme.textTheme.headline1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}

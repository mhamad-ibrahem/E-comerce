import 'package:ecommerce/controller/DetailesController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Core/Constant/Colors.dart';

class MoreDetail extends StatelessWidget {
  const MoreDetail({
    Key? key,
    required detailesController,
  })  : _detailesController = detailesController,
        super(key: key);
  final DetailesController _detailesController;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailesController>(
      builder: (controller) => Visibility(
        visible: _detailesController.showDetailVisiablility,
        child: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: MaterialButton(
              onPressed: () => _detailesController.seeMoreDetail(),
              child: Row(
                children: [
                  Text(
                    'See More Detail',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color:AppColor. orange,
                    size: 15,
                  )
                ],
              )),
        ),
      ),
    );
  }
}

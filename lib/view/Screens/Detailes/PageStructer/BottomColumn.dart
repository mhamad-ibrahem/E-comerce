import 'package:flutter/material.dart';

import '../../../../Core/Constant/Colors.dart';
import '../../../../controller/DetailesController.dart';

import '../../../../data/model/functions.dart';
import '../../../Widget/CustomButton.dart';
import '../DetailesCustoms/ColorsAndQuntity.dart';
import '../DetailesCustoms/DescriptionText.dart';
import '../DetailesCustoms/FavouriteButton.dart';
import '../DetailesCustoms/MoreDetail.dart';

class BottomColumn extends StatelessWidget {
  const BottomColumn({
    Key? key,
    required DetailesController detailesController,
  })  : _detailesController = detailesController,
        super(key: key);

  final DetailesController _detailesController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.8,
      color: lightGrey,
      child: Container(
        padding: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            color: white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Product Name
            Text(_detailesController.products[0].name, style: blackTextStyle()),
            //Add to Favourite Button
            FavouriteButton(detailesController: _detailesController),
            //Description of The Product
            DescriptionText(detailesController: _detailesController),
            //More Detail Button To show More Detailes
            MoreDetail(detailesController: _detailesController),
            //The Colors And plus-minus Row
            ColorsAndQuntityContainer(detailesController: _detailesController),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
                onTap: () {},
                buttonBody: 'Add to Chart',
                buttonradius: 20,
                containerWidth: MediaQuery.of(context).size.width / 1.5),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constant/Colors.dart';
import '../../../controller/DetailesController.dart';

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({
    Key? key,
    required DetailesController detailesController,
  })  : _detailesController = detailesController,
        super(key: key);
  final DetailesController _detailesController;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailesController>(
      builder: (controller) => InkWell(
          onTap: () => _detailesController.addOrRemoveFromFavourite(),
          child: _detailesController.isFavourite == true
              ? Container(
                  height: 50,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 1.2),
                  width: 80,
                  decoration: BoxDecoration(
                    color: lightPink,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        bottomLeft: Radius.circular(40)),
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: red,
                  ),
                )
              : Container(
                  height: 50,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 1.2),
                  width: 80,
                  decoration: BoxDecoration(
                    color: grey,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        bottomLeft: Radius.circular(40)),
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: deepGrey,
                  ),
                )),
    );
  }
}

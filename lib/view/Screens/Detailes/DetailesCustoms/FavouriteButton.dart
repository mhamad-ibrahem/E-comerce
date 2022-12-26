import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Constant/Colors.dart';
import '../../../../Core/Constant/ScreenSize.dart';
import '../../../../controller/DetailesController.dart';

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
                      left: AppSize.screenWidth / 1.2),
                  width: 80,
                  decoration: const BoxDecoration(
                    color: AppColor.lightPink,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        bottomLeft: Radius.circular(40)),
                  ),
                  child: const Icon(
                    Icons.favorite,
                    color: AppColor.red,
                  ),
                )
              : Container(
                  height: 50,
                  margin: EdgeInsets.only(
                      left: AppSize.screenWidth / 1.2),
                  width: 80,
                  decoration: const BoxDecoration(
                    color: AppColor.grey,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        bottomLeft: Radius.circular(40)),
                  ),
                  child: const Icon(
                    Icons.favorite,
                    color:AppColor. deepGrey,
                  ),
                )),
    );
  }
}

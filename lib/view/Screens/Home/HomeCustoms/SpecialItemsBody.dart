import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Core/Constant/apiLinks.dart';
import 'package:ecommerce/data/model/Home/Items/ItemsModel.dart';
import 'package:flutter/material.dart';

import '../../../../Core/Constant/Colors.dart';

class SpecialOpacityContainer extends StatelessWidget {
  const SpecialOpacityContainer({
    Key? key,
    required this.itemsModel,
  }) : super(key: key);
  final ItemsModel itemsModel;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width / 1.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: CachedNetworkImage(
              imageUrl: "${AppLinks.itemsImageLink}/${itemsModel.itemImage}",
              fit: BoxFit.fill,
            ),
          ),
          Container(
              padding: const EdgeInsets.only(top: 17, left: 20),
              height: 100,
              width: MediaQuery.of(context).size.width / 1.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                    colors: [
                      AppColor.black.withOpacity(0.4),
                      AppColor.white.withOpacity(0.2)
                    ],
                    stops: const [
                      0.0003,
                      1
                    ]),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemsModel.itemName!,
                    style: const TextStyle(
                        color: AppColor.white,
                        fontSize: 20,
                        fontFamily: 'muli',
                        fontWeight: FontWeight.w900),
                  ),
                  Text(itemsModel.itemDescriprion!,
                      style: const TextStyle(
                          color: AppColor.white,
                          fontSize: 15,
                          fontFamily: 'muli',
                          fontWeight: FontWeight.bold))
                ],
              )),
        ],
      ),
    );
  }
}

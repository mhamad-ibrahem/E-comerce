import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Constant/Colors.dart';
import '../../../../Core/Constant/ScreenSize.dart';
import '../../../../Core/Constant/apiLinks.dart';
import '../../../../controller/Details/DetailesController.dart';
import '../DetailesCustoms/TopBar.dart';

class TopColumn extends GetView<DetailesControllerImplement> {
  const TopColumn({super.key});
 
  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 260,
      decoration: const BoxDecoration(color:AppColor. veryLightGrey,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const TopBar(),
           SizedBox(
                height: 200,
                width: AppSize.screenWidth / 2,
                child: GetBuilder<DetailesControllerImplement>(
                  builder:(controller)=> ColorFiltered(
                    colorFilter: ColorFilter.mode(controller.activeColor!,BlendMode.hue),
                    child: Container(
                      color: AppColor.veryLightGrey,
                      child: Hero(
                         tag: controller.itemsModel.itemId!,
                        child: CachedNetworkImage(
                          imageUrl:"${AppLinks.itemsImageLink}/${controller.itemsModel.itemImage}",fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                )),
        ],
      ),
    );
  }
}

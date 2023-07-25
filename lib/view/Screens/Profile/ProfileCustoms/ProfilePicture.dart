import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Core/Constant/apiLinks.dart';
import 'package:ecommerce/Core/Constant/imageAsset.dart';
import 'package:ecommerce/controller/Profile/ProfileController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Core/Constant/Colors.dart';
import 'chhose_image_bottom_sheet.dart';

class ProfilePicture extends StatelessWidget {
  ProfilePicture({
    Key? key,
    this.isProfile = false,
  }) : super(key: key);
  final bool isProfile;
  final ProfileImplement controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 65,
          backgroundColor: AppColor.lightGrey,
          backgroundImage: (controller.profileModel.image == null ||
                  controller.profileModel.image == '')
              ? const AssetImage(
                  AppImageAsset.profileImage,
                )
              : CachedNetworkImageProvider(AppLinks.profileImagesLink +
                  controller.profileModel.image!) as ImageProvider,
        ),
        if (isProfile == false)
          Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                radius: 25,
                backgroundColor: AppColor.white,
                child: IconButton(
                    onPressed: () {
                      openEditBottomSheet(
                        context,
                        () {
                          Get.back();
                          controller.uploadGalleryImage();
                        },
                        () {
                          Get.back();
                          controller.uploadCameraImage();
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.add_a_photo_outlined,
                      color: AppColor.deepGrey,
                    )),
              ))
      ],
    );
  }
}

import 'package:ecommerce/Core/Constant/imageAsset.dart';
import 'package:flutter/material.dart';

import '../../../../Core/Constant/Colors.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 65,
          backgroundColor: AppColor.lightGrey,
          child: Image.asset(
            AppImageAsset.profileImage,
            height: 70,
            width: 70,
          ),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: AppColor.white,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_a_photo_outlined,
                    color: AppColor.deepGrey,
                  )),
            ))
      ],
    );
  }
}

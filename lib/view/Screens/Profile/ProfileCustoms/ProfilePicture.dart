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
          backgroundColor: lightGrey,
          child: Image.asset(
            'assets/images/user.png',
            height: 70,
            width: 70,
          ),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: white,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_a_photo_outlined,
                    color: deepGrey,
                  )),
            ))
      ],
    );
  }
}

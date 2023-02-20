import 'package:flutter/material.dart';
import '../../../../Core/Constant/Colors.dart';


class ProfileItem extends StatelessWidget {
  const ProfileItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,w
    
  }) : super(key: key);
  final String title;
  final IconData icon;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: GestureDetector(
          onTap: onTap,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color:AppColor. mostLightGrey,
            child: ListTile(
              leading: Icon(
                icon,
                color:AppColor. orange,
              ),
              title: Text(
                title,
                style: Theme.of(context).textTheme.headline1,
              ),
              trailing:const Icon(
                Icons.arrow_forward_ios,
                color:AppColor. grey,
              ),
            ),
          ),
        ));
  }
}

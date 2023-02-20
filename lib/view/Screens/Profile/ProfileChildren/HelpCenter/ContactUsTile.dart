import 'package:ecommerce/Core/Constant/Colors.dart';
import 'package:flutter/material.dart';

class ContactUsTile extends StatelessWidget {
  const ContactUsTile(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.icon});
  final String title;
  final String subTitle;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppColor.deepOrange,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 17),
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }
}

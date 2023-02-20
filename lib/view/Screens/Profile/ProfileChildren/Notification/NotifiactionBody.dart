import 'package:ecommerce/Core/Constant/Colors.dart';
import 'package:flutter/material.dart';

import '../../../../../Core/Constant/ScreenSize.dart';

class NotifiactionsBody extends StatelessWidget {
  const NotifiactionsBody(
      {
      required this.notificationsTitle,
      required this.notificationsSubTitle,
      required this.onDismissed,
      required this.onTap});
  final String notificationsTitle;
  final String notificationsSubTitle;
  final void Function(DismissDirection)? onDismissed;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        height: 100,
        padding: EdgeInsets.only(left: AppSize.screenWidth / 1.7),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColor.lightPink,
        ),
        child: const Icon(
          Icons.delete_outline_outlined,
          color: AppColor.red,
          size: 30,
        ),
      ),
      onDismissed: (direction) => onDismissed,
      child: ListTile(
        onTap: onTap,
        title: Text(
          notificationsTitle,
          style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 15),
        ),
        leading: const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Icon(
            Icons.notifications_active,
            color: AppColor.deepOrange,
          ),
        ),
        subtitle: Text(
          notificationsSubTitle,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }
}

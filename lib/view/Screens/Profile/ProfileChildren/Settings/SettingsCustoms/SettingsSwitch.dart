import 'package:flutter/material.dart';
import '../../../../../../Core/Constant/Colors.dart';
import '../../../../../../Core/Constant/fonts.dart';

class SettingsSwitch extends StatelessWidget {
  const SettingsSwitch({
    Key? key,
    required this.title,
    required this.onChanged,
    required this.checkValue,
  }) : super(key: key);
  final bool checkValue;
  final String title;
  final void Function(bool) onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: SwitchListTile(
        title: Text(
          title,
          style: blackTextStyle(),
        ),
        value: checkValue,
        onChanged: onChanged,
        activeTrackColor: AppColor.orange,
        activeColor: AppColor.white,
      ),
    );
  }
}

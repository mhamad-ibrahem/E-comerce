import 'package:flutter/material.dart';

import '../../../../Core/Constant/Colors.dart';
import '../../../../data/model/functions.dart';

class SettingsSwitch extends StatelessWidget {
  const SettingsSwitch({
    Key? key,
    required this.title,
    required this.onChanged,
  }) : super(key: key);
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
        value: true,
        onChanged: onChanged,
        activeTrackColor: orange,
        activeColor: white,
      ),
    );
  }
}

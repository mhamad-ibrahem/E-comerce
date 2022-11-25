import 'package:ecommerce/view/Widget/PageTitle.dart';
import 'package:flutter/material.dart';

import 'SettingsCustoms/SettingsSwitch.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const PageTitle(title: 'Settings'),
            const SizedBox(
              height: 20,
            ),
            SettingsSwitch(
              title: 'Notifications',
              onChanged: (val) {},
            ),
            const SizedBox(
              height: 10,
            ),
            SettingsSwitch(title: 'Ask before buy', onChanged: (val) {}),
            const SizedBox(
              height: 10,
            ),
            SettingsSwitch(title: 'Dark Mode', onChanged: (val) {})
          ],
        ),
      ),
    );
  }
}

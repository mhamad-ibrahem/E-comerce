import 'package:flutter/material.dart';

import '../../../../../Core/Constant/Colors.dart';

class FaqTile extends StatelessWidget {
  const FaqTile({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.headline2,
          ),
          trailing: const Icon(Icons.arrow_forward,color: AppColor.deepOrange,),
        ),
        const Divider(
          height: 1,
          color: AppColor.black,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import 'CartButtonRow.dart';
import 'CartTextFieldRow.dart';

class BottomSizedBox extends StatelessWidget {
  const BottomSizedBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          //Upper Row That Contains TextField
          CartTextFieldRow(),
          //Bottom Row That Conatins Check Out Button
          CartButtonRow(),
        ],
      ),
    );
  }
}

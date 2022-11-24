import 'package:flutter/material.dart';

import '../../../model/functions.dart';

class StoreName extends StatelessWidget {
  const StoreName({
    Key? key,
    required this.storeName,
  }) : super(key: key);
  final String storeName;
  @override
  Widget build(BuildContext context) {
    return Text(
      storeName,
      style: blackTextStyle(),
    );
  }
}

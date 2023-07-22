import 'package:ecommerce/view/Widget/PageTitle.dart';
import 'package:flutter/material.dart';

import 'custom_app_bar.dart';

class CustomAppPage extends StatelessWidget {
  const CustomAppPage({
    super.key,
    required this.isScroll,
    required this.title,
    required this.backArrowVisiablity,
    required this.body,
  });
  final String title;
  final bool backArrowVisiablity;
  final Widget body;
  final bool isScroll;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(context, title, backArrowVisiablity),
        body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: isScroll == true
                ? SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [body],
                    ),
                  )
                : Column(
                    children: [body],
                  )),
      ),
    );
  }
}

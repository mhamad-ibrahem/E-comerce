import 'package:ecommerce/view/Widget/PageTitle.dart';
import 'package:flutter/material.dart';

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
        body: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
            child: isScroll == true
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        PageTitle(
                            title: title,
                            backArrowVisiablity: backArrowVisiablity),
                        body
                      ],
                    ),
                  )
                : Column(
                    children: [
                      PageTitle(
                          title: title,
                          backArrowVisiablity: backArrowVisiablity),
                      body
                    ],
                  )),
      ),
    );
  }
}

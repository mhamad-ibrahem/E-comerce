import 'package:ecommerce/view/Widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class OrdersDetailsPage extends StatelessWidget {
  const OrdersDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "Order Details", true),
    );
  }
}

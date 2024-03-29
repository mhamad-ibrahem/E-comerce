
import 'package:ecommerce/controller/Details/DetailesController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'PageStructer/BottomColumn.dart';
import 'PageStructer/TopColumn.dart';

class ProductsDetailes extends StatelessWidget {
  ProductsDetailes({Key? key}) : super(key: key);
  final DetailesControllerImplement controller = Get.put(DetailesControllerImplement());
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children:[
             Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:const  [
              //The Top Part of The Page
              TopColumn(),
              //The Bottom Part of The Page
              BottomColumn(),
            ],
          ),
          ]
        ),
      ),
    );
  }
}

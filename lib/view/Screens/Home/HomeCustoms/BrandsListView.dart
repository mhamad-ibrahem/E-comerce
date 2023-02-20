
import 'package:ecommerce/controller/Home/HomeController.dart';
import 'package:ecommerce/view/Screens/Home/HomeCustoms/SpecialItemsBody.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';


class BrandsListView extends StatelessWidget {
  const BrandsListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImplement>(
        builder: ((controller) => SizedBox(
            height: 100,
            width: double.infinity,
            child: ListView.separated(
              separatorBuilder: (context, index) =>const SizedBox(width: 15,),
                scrollDirection: Axis.horizontal,
                itemCount: controller.itemsList.length,
                itemBuilder: (context, index) => SpecialOpacityContainer( image: controller.itemsList[index].itemImage!,
                name:controller.itemsList[index].itemName! ,
                description: controller.itemsList[index].itemDescriprion!,
                    ))
                    )
                    )
                    );
  }
}



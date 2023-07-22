import 'package:ecommerce/Core/Constant/Colors.dart';
import 'package:ecommerce/Core/Constant/ScreenSize.dart';
import 'package:ecommerce/Core/classes/HandilingData.dart';
import 'package:ecommerce/controller/Profile/Addrees/AddressController.dart';
import 'package:ecommerce/view/Widget/PageTitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationAddress extends StatelessWidget {
  LocationAddress({super.key});
  final AddreessControllerImplement controller =
      Get.put(AddreessControllerImplement());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.goToMapAddress();
        },
        backgroundColor: AppColor.deepOrange,
        child: const Icon(
          Icons.add,
          color: AppColor.white,
        ),
      ),
      body: Column(children: [
        const SizedBox(
          height: 20,
        ),
        const PageTitle(title: "Address", backArrowVisiablity: true),
        SizedBox(
          height: AppSize.screenHight * 0.5,
          child: GetBuilder<AddreessControllerImplement>(
            builder: (controller) => HandilingDataView(
              statusRequest: controller.statusRequest!,
              widget: ListView.separated(
                  itemBuilder: (context, index) => ListTile(
                        title: Text(
                          controller.addressList[index].addressName,
                          style: const TextStyle(
                              fontSize: 17,
                              color: AppColor.black,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          controller.addressList[index].addressCity,
                          style: const TextStyle(
                              fontSize: 13,
                              color: AppColor.deepGrey,
                              fontWeight: FontWeight.w500),
                        ),
                        leading: const Icon(
                          Icons.location_on,
                          color: AppColor.deepOrange,
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete_outline_rounded,
                            color: AppColor.red,
                          ),
                          onPressed: () {
                            controller.deleteAddress(
                                controller.addressList[index].addressId);
                          },
                        ),
                      ),
                  separatorBuilder: (context, index) => const Divider(
                        thickness: 1.3,
                      ),
                  itemCount: controller.addressList.length),
            ),
          ),
        )
      ]),
    ));
  }
}

import 'package:ecommerce/Core/Constant/Colors.dart';
import 'package:ecommerce/Core/Constant/ScreenSize.dart';
import 'package:ecommerce/controller/Profile/HelpCeneter/HelpCeneterController.dart';
import 'package:ecommerce/view/Screens/Profile/ProfileChildren/HelpCenter/ContactUsTile.dart';
import 'package:ecommerce/view/Screens/Profile/ProfileChildren/HelpCenter/FaqTile.dart';
import 'package:ecommerce/view/Widget/CustomAppPage.dart';
import 'package:ecommerce/view/Widget/PageTitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpCenterScreen extends GetView<HelpCenterImplement> {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HelpCenterImplement());
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PageTitle(title: "Help Center", backArrowVisiablity: true),
              const SizedBox(
                height: 20,
              ),
              Text(
                "FAQ :",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 20),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: AppSize.screenWidth,
                height: AppSize.screenHight * 0.4,
                child: ListView.builder(
                    itemBuilder: (context, index) =>
                        FaqTile(title: controller.faqList[index]),
                    itemCount: controller.faqList.length),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Contact Us",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 17),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 20,
              ),
              const ContactUsTile(
                  title: "Chat With Us",
                  subTitle: "you can chat with us here",
                  icon: Icons.message_outlined),
              const ContactUsTile(
                  title: "Send Email",
                  subTitle: "you can send your question here",
                  icon: Icons.email_outlined),
              const ContactUsTile(
                  title: "Customer services",
                  subTitle: "0966769532",
                  icon: Icons.phone),
                   const SizedBox(
                height: 10,
              ),
            ],
          )),
        ),
      ),
    );
  }
}

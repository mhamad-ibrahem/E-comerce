import 'package:ecommerce/Core/Binding/Bindings.dart';
import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/Core/Theme/Themes.dart';
import 'package:ecommerce/Core/services/Services.dart';
import 'package:ecommerce/routes.dart';
import 'package:ecommerce/view/testView.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


Future backgroundNotification(RemoteMessage message)async{
    print("====================================================");
   
  }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
   FirebaseMessaging.onBackgroundMessage(backgroundNotification);
  runApp(const Ecommerce());
}

class Ecommerce extends StatelessWidget {
  const Ecommerce({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.lightsTheme,
      initialRoute: AppRoute.onBording,
      // home:const TimerPage(),
      getPages: routes,
      initialBinding: MyBindings(),
    );
  }
}

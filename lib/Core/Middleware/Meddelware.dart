import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/Core/services/Services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;
  Services services = Get.find();
  @override 
  RouteSettings? redirect(String? route){
   if(services.box.get('onBording') == '1'){
    return const RouteSettings(name: AppRoute.signIn);
   }
   return null;
  }
}

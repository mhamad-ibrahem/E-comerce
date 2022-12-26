import 'package:ecommerce/Core/classes/Crud.dart';
import 'package:get/get.dart';

class MyBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(Crud());
  }

}
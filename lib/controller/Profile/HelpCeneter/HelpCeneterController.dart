import 'package:get/get.dart';

abstract class HelpCeneterController extends GetxController {}

class HelpCenterImplement extends HelpCeneterController {
  List faqList = [
    "How i can add product to favorite",
    "How i can add product to cart",
    "How i can restore my account",
    "How i can cancel the order",
    "How i can change my password"
  ];
}

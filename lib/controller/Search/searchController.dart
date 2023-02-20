import 'package:ecommerce/data/DataSource/remote/Home/HomeData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/classes/statusRequest.dart';
import '../../Core/functions/handilingData.dart';
import '../../data/model/Home/Items/ItemsModel.dart';

class SearchController extends GetxController {
  bool isSearch = false;
  TextEditingController search = TextEditingController();
  List<ItemsModel> searchItem = [];
   HomeData homeData = HomeData(Get.find());
   StatusRequest? statusRequest;
   checkSearch(val) {
    if (val == '') {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItem() {
    isSearch = true;
    searchData();
    update();
  }

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.searchData(search.text);
    statusRequest = handilingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        searchItem.clear();
        List responsList = response['data'];
        searchItem.addAll(responsList.map((e) => ItemsModel.fromJson(e)));
        print('==============================');
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }
}

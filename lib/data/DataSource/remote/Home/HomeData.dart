

import 'package:ecommerce/Core/Constant/apiLinks.dart';
import 'package:ecommerce/Core/classes/Crud.dart';

class HomeData{
  
  Crud crud;
  HomeData(this.crud);

  getData()async{
    var response = await crud.postData(AppLinks.homeLink, {});
   return response.fold((l) => l, (r) => r);
  }
  

}
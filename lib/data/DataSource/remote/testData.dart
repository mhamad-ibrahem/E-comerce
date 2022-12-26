
import 'package:ecommerce/Core/Constant/apiLinks.dart';
import 'package:ecommerce/Core/classes/Crud.dart';

class TestData{
  
  Crud crud;
  TestData(this.crud);

  getData()async{
    var response = await crud.postData(AppLinks.testLink, {});
   return response.fold((l) => l, (r) => r);
  }
  

}
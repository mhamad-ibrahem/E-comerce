import 'package:ecommerce/Core/classes/statusRequest.dart';


handilingData (response){
  if(response is StatusRequest){
    return response;
  }
  else{
    return StatusRequest.success;
    
  }
}
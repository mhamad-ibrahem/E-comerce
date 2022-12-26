import 'package:get/get.dart';

validation(String value, int min ,int max ,String type ){
  if(type == 'userName'){
    if(!GetUtils.isUsername(value)){
      return 'Not valid user name ';
    }
  }
  if(type == 'emial'){
    if(!GetUtils.isEmail(value)){
      return 'Email not valid';
    }
  }
   if(type == 'Number'){
    if(!GetUtils.isPhoneNumber(value)){
      return 'Email not valid';
    }
  } 
  if(value.isEmpty){
    return "can't be empty";
  }
  if(value.length < min){
    return "can't be less than $min";
  }
  if(value.length > max ){
    return "can't be more than $max";
  }
}


confirmValidate(String passwordValue , String confirmPasswordValue){
  if(  confirmPasswordValue != passwordValue){
    return 'confirm password didnt match password';
  }
}
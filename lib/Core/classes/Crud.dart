import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/Core/classes/statusRequest.dart';
import 'package:ecommerce/Core/functions/checkInternetConnection.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkUrl, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkUrl), body: data);
        print('=======================================');
        print(response.statusCode);
        print('=======================================');
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          print('=======================================');
          print(responseBody);
          print('=======================================');
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFaliure);
        }
      } else {
        return const Left(StatusRequest.offlineFaliure);
      }
    } catch (_) {
      log('$_');
      return const Left(StatusRequest.serverException);
    }
  }
}

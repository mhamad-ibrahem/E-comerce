import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/Core/classes/statusRequest.dart';
import 'package:ecommerce/Core/functions/checkInternetConnection.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

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

  Future<Either<StatusRequest, Map>> multiPartRequest(
      String linkUrl, Map<String, dynamic> data, File? file) async {
    try {
      if (await checkInternet()) {
        var request = http.MultipartRequest('POST', Uri.parse(linkUrl));
        var length = await file?.length();
        var stream = http.ByteStream(file!.openRead());
        if (length != 0) {
          var multiPartFile = http.MultipartFile('image', stream, length!,
              filename: basename(file.path));
          request.files.add(multiPartFile);
        }
        data.forEach((key, value) {
          request.fields[key] = value;
        });
        var myRequest = await request.send();
        var response = await http.Response.fromStream(myRequest);
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
      log('catch error  $_');
      return const Left(StatusRequest.serverException);
    }
  }
}

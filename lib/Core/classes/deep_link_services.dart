import 'dart:developer';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../Constant/routes.dart';

class DeepLinkSevice {
  static Future<String> createDynamicLink(bool short, String id) async {
    FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: "https://jostore2000000webhostapp.page.link", //domain link
      link: Uri.parse(
          "https://mhg.page.link/product?id=$id"), //website product link
      androidParameters: AndroidParameters(
        packageName: "com.example.ecommerce", //app package name
        minimumVersion: 0,
        fallbackUrl: Uri.parse(
            "https://mhamad-ibrahem.github.io/"), //url to  make user go to another link
      ),
      iosParameters: const IOSParameters(
        bundleId: "com.example.ecommerce",
      ),
    );
    Uri url;
    if (short) {
      final ShortDynamicLink shortLink =
          await dynamicLinks.buildShortLink(parameters);
      url = shortLink.shortUrl;
    } else {
      url = await dynamicLinks.buildLink(parameters);
    }
    log("url is: $url");
    return url.toString();
  }

  static Future<void> initDynamicLink() async {
    PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    if (data != null) {
      log("deep link: $data");
      final Uri uri = data.link;
      log("dynamic Link Data : $uri");
      var isService = uri.pathSegments.contains('product');
      if (isService) {
        var id = uri.queryParameters['id'];
        if (id != null) {
          //the page that open app in it
          Get.toNamed(AppRoute.details);
        }
      }
    }
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      final Uri uri = dynamicLinkData.link;
      log("dynamic Link Data: $uri");
      var isService = uri.pathSegments.contains('product');
      if (isService) {
        var id = uri.queryParameters['id'];
        if (id != null) {
          Get.toNamed(AppRoute.details);
        }
      }
    }).onError((error) {
      log('onLink error');
      print(error.message);
      Get.snackbar("Error Lunch Deep Link", error.message);
    });
  }

  static Future<void> shareProduct(int id) async {
    try {
      String linkMessage = await createDynamicLink(
        false,
        '$id',
      );
      await Share.share(linkMessage);
    } catch (e, s) {
      log("$e $s");
    }
  }
}

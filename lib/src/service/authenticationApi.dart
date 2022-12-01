import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:mafc_flutter/src/data/db.dart';
import 'package:mafc_flutter/src/models/login.dart';
import 'package:mafc_flutter/src/service/baseApi.dart';
import 'package:mafc_flutter/src/service/url.dart';
import 'package:http/http.dart' as http;

class AuthenticationApi extends GetxController {
  // static FutureOr<LoginModel?> login(
  //     String username, String password, bool isManual) async {
  //   var body = {
  //     'username': username,
  //     'password': password,
  //     'isManual': isManual
  //   };
  //   // send request
  //   var res = await BaseApi().post(URL.login, body);
  //   // check request
  //   print('----- ${res}');
  // }
  static Future<LoginModel?> login(String email, String password) async {
    var body = {
      'email': email,
      'password': password,
    };
    http.Response res = await BaseApi().post(URL.login, body);
    print(res.body);
    if (res.body != null) {
      final json = jsonDecode(res.body);
      return LoginModel.fromJson(json['data']);
    } else {
      return null;
    }
  }
}

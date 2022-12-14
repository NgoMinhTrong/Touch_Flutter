import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mafc_flutter/src/data/db.dart';
import 'package:mafc_flutter/src/models/login.dart';

class BaseApi {
  static const String baseURL = 'http://restapi.adequateshop.com/';
  static var client = http.Client();
  get(String name, [String? params]) async {
    Map<String, String> paramsObject = {};
    if (params != null) {
      params.split('&').forEach((element) {
        paramsObject[element.split('=')[0].toString()] =
            element.split('=')[1].toString();
      });
    }
    http.Response response = await http.get(
      params == null
          ? Uri.https(baseURL, '/' + name)
          : Uri.https(baseURL, '/' + name, paramsObject),
      headers: getHeader(),
    );
    return response;
  }

  post(String name, Map<String, dynamic> body) async {
    var res = await http.post(
      Uri.parse(baseURL + name),
      body: jsonEncode(body),
      headers: getHeader(),
    );
    if (res.statusCode == 200) {
      print(
          '==================== HTTP SUCCESS ====================: ${res.body.toString()}');
      return res;
    } else {
      print(
          '==================== HTTP FAIL ====================: ${res.statusCode}');
      return null;
    }
  }

  put(String name, Map<String, dynamic> body) async {
    return await http.put(
      Uri.https(baseURL, '/' + name),
      headers: getHeader(),
      body: jsonEncode(body),
    );
  }

  patch(String name, Map<String, dynamic> body) async {
    return await http.patch(
      Uri.https(baseURL, '/' + name),
      headers: getHeader(),
      body: jsonEncode(body),
    );
  }

  delete(String name, {Map<String, dynamic>? body}) async {
    return await http.delete(
      Uri.https(baseURL, '/' + name),
      headers: getHeader(),
    );
  }

  getHeader() {
    return <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Connection': 'keep-alive',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Authorization': 'Bearer ${db.getAccessToken()}',
    };
  }
}

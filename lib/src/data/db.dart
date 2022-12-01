import 'dart:convert';
import 'package:mafc_flutter/src/models/accountModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DB {
  DB();
  late SharedPreferences prefs;
  Future<void> init() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    prefs = _prefs;
  }

  Future<void> setAccessToken(String data) async {
    await prefs.setString('access_token', data);
  }

  String getAccessToken() {
    return prefs.getString('access_token') ?? "";
  }

  Future<void> setRefreshToken(String data) async {
    await prefs.setString('refresh_token', data);
  }

  String getRefreshToken() {
    return prefs.getString('refresh_token') ?? "";
  }

  Future<void> setAccountModel(AccountModel accountModel) async {
    await prefs.setString('account', jsonEncode(accountModel.toMap()));
  }

  AccountModel? getAccountModel() {
    var _accountString = prefs.getString('account');
    if (_accountString == null) return null;
    return AccountModel.fromMap(jsonDecode(_accountString));
  }
}

DB db = DB();

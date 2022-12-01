import 'package:get/get.dart';
import 'package:mafc_flutter/src/helpers.dart/loading.dart';
import 'package:mafc_flutter/src/models/login.dart';
import 'package:mafc_flutter/src/screens/home.dart';
import 'package:mafc_flutter/src/service/authenticationApi.dart';

class LoginController extends GetxController {
  login(String email, String password) async {
    Loading.show();
    LoginModel? result = await AuthenticationApi.login(email, password);
    Loading.dismiss();
    if (result?.Token != '') {
      Get.to(() => Home());
    } else {
      print('Can not Loginss');
    }
  }
}

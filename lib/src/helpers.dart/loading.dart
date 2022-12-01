import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mafc_flutter/src/constants/colors.dart';

class Loading {
  static bool _isDialogShowing = false;
  static show([BuildContext? context]) {
    if (_isDialogShowing) return;
    _isDialogShowing = true;
    showDialog(
      context: context ?? Get.context as BuildContext,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Center(
            child: CircularProgressIndicator(color: AppColors.backgroundColor),
          ),
        );
      },
      barrierColor: Color(0x80000000),
      barrierDismissible: false,
    ).whenComplete(() => _isDialogShowing = false);
  }

  static dismiss() {
    if (_isDialogShowing) {
      Get.back();
    }
  }
}

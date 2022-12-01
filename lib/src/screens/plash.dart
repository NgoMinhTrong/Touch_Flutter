import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mafc_flutter/src/constants/colors.dart';

class Plash extends StatefulWidget {
  const Plash({super.key});

  @override
  State<Plash> createState() => _PlashState();
}

class _PlashState extends State<Plash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.backgroundColor,
        child: Image.asset(
          'assets/images/launcher.gif',
          width: Get.width,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mafc_flutter/src/constants/colors.dart';
import 'package:mafc_flutter/src/screens/login.dart';
import '../widgets/buttonWidgets/buttonPrimary.dart';

class Wellcome extends StatefulWidget {
  const Wellcome({super.key});

  @override
  State<Wellcome> createState() => _WellcomeState();
}

class _WellcomeState extends State<Wellcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/imgintro.png',
              width: Get.width,
              fit: BoxFit.fitWidth,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              padding: EdgeInsets.only(bottom: 90),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/logo_txt.png',
                    width: 53,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Chào bạn',
                            style: TextStyle(
                                fontSize: 44,
                                color: AppColors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Image.asset(
                            'assets/icons/ic_wellcome.png',
                            width: 52,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text.rich(TextSpan(
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w400,
                              color: AppColors.white),
                          children: [
                            TextSpan(text: 'Nhận ngay'),
                            TextSpan(
                                text: ' Kết quả hạn mức',
                                style: TextStyle(fontWeight: FontWeight.w600)),
                            TextSpan(text: '\nTrong vòng'),
                            TextSpan(
                                text: ' 5 phút',
                                style: TextStyle(fontWeight: FontWeight.w600)),
                          ])),
                      Container(
                        margin: EdgeInsets.only(top: 69, bottom: 16),
                        alignment: Alignment.center,
                        child: ButtonPrimary(
                          handlePressed: () {},
                          text: 'Kiểm tra hạn mức',
                        ),
                      ),
                      ButtonPrimary(
                        handlePressed: () {
                          Get.to(() => Login());
                        },
                        text: 'Đăng nhập',
                        color: AppColors.white,
                        colorText: AppColors.blue80,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

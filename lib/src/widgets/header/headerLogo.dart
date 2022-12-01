import 'package:flutter/material.dart';
import 'package:mafc_flutter/src/constants/colors.dart';

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Image.asset(
            'assets/images/logomia-1.png',
            width: 121,
          ),
        ),
        Divider(
          height: 2,
          thickness: 2,
          color: AppColors.divider,
        )
      ],
    );
  }
}

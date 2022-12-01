import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:mafc_flutter/src/screens/wellcome.dart';
import '../constants/colors.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  List<ContentConfig> listContentConfig = [];
  Color activeColor = AppColors.backgroundColor;
  Color inactiveColor = AppColors.accent;
  double sizeIndicator = 15;

  @override
  void initState() {
    super.initState();

    listContentConfig.add(
      ContentConfig(
        backgroundBlendMode: BlendMode.lighten,
        backgroundImage: "assets/images/intro1.png",
      ),
    );
    listContentConfig.add(
      ContentConfig(
          backgroundBlendMode: BlendMode.lighten,
          backgroundImage: "assets/images/intro2.png"),
    );
    listContentConfig.add(
      ContentConfig(
        backgroundBlendMode: BlendMode.lighten,
        backgroundImage: "assets/images/intro3.png",
      ),
    );
  }

  void onDonePress() {
    Get.off(() => Wellcome());
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
      foregroundColor: MaterialStateProperty.all<Color>(activeColor),
      backgroundColor: MaterialStateProperty.all<Color>(inactiveColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      // Content config
      listContentConfig: listContentConfig,

      // Skip button
      isShowPrevBtn: false,
      isShowSkipBtn: false,

      // Next button
      isShowNextBtn: false,

      // Done button
      onDonePress: onDonePress,
      isShowDoneBtn: true,

      // Indicator
      indicatorConfig: IndicatorConfig(
        sizeIndicator: sizeIndicator,
        indicatorWidget: Container(
          width: sizeIndicator,
          height: 5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4), color: inactiveColor),
        ),
        activeIndicatorWidget: Container(
          width: sizeIndicator,
          height: 5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4), color: activeColor),
        ),
        spaceBetweenIndicator: 10,
        typeIndicatorAnimation: TypeIndicatorAnimation.sliding,
      ),

      // Scroll behavior
      isAutoScroll: false,
      isLoopAutoScroll: false,
      curveScroll: Curves.bounceIn,
    );
  }
}

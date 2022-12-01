import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mafc_flutter/src/constants/colors.dart';
import 'package:mafc_flutter/src/widgets/buttonWidgets/touchableOpacity.dart';

class ButtonPrimary extends StatefulWidget {
  Function handlePressed;
  bool disabled;
  String text;
  double textSize;
  double paddingHorizontal;
  double paddingVertical;
  Color color;
  Color colorText;
  double borderRadius;
  FontWeight fontWeight;
  double borderWidth;
  Color borderWidthColor;
  bool active;

  ButtonPrimary(
      {required this.handlePressed,
      this.active = true,
      this.disabled = false,
      this.text = 'Tiếp tục',
      this.textSize = 16,
      this.paddingHorizontal = 26.0,
      this.paddingVertical = 20.0,
      this.color = AppColors.primaryColor,
      this.colorText = Colors.white,
      this.fontWeight = FontWeight.bold,
      this.borderRadius = 40.0,
      this.borderWidth = 0,
      this.borderWidthColor = Colors.transparent});

  @override
  _ButtonPrimaryState createState() => _ButtonPrimaryState();
}

class _ButtonPrimaryState extends State<ButtonPrimary> {
  Color? renderButtonColor() {
    if (widget.disabled) return AppColors.inActiveBackground;
    if (widget.color != null) return widget.color;
    return null;
  }

  double? textSize;
  @override
  void initState() {
    textSize = widget.textSize;
  }

  @override
  Widget build(BuildContext context) {
    return widget.active
        ? TouchableOpacity(
            onTap: () {
              if (!widget.disabled) {
                widget.handlePressed();
              }
            },
            child: Container(
              width: Get.width,
              padding: EdgeInsets.symmetric(
                vertical: widget.paddingVertical,
                horizontal: widget.paddingHorizontal,
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: widget.borderWidth,
                      color: widget.borderWidthColor),
                  borderRadius: new BorderRadius.circular(widget.borderRadius),
                  color: widget.color),
              child: Text(
                widget.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: widget.textSize,
                    color: widget.colorText,
                    fontWeight: widget.fontWeight),
              ),
            ),
          )
        : Container(
            width: Get.width,
            padding: EdgeInsets.symmetric(
              vertical: widget.paddingVertical,
              horizontal: widget.paddingHorizontal,
            ),
            decoration: BoxDecoration(
                border: Border.all(
                    width: widget.borderWidth, color: widget.borderWidthColor),
                borderRadius: new BorderRadius.circular(widget.borderRadius),
                color: AppColors.inActiveBackground),
            child: Text(
              widget.text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: widget.textSize,
                  color: widget.colorText,
                  fontWeight: widget.fontWeight),
            ),
          );
  }
}

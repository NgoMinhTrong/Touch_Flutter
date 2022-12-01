import 'package:flutter/material.dart';
import 'package:mafc_flutter/src/widgets/buttonWidgets/touchableOpacity.dart';

class CustomButton extends StatefulWidget {
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

  CustomButton(
      {required this.handlePressed,
      this.disabled = false,
      this.text = 'Tiếp tục',
      this.textSize = 11,
      this.paddingHorizontal = 26.0,
      this.paddingVertical = 6.0,
      this.color = Colors.amber,
      this.colorText = Colors.white,
      this.fontWeight = FontWeight.bold,
      this.borderRadius = 40.0,
      this.borderWidth = 0,
      this.borderWidthColor = Colors.transparent});

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  Color? renderButtonColor() {
    if (widget.disabled) return Color(0xff828282);
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
    return TouchableOpacity(
      onTap: () {
        if (!widget.disabled) {
          widget.handlePressed();
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: widget.paddingVertical,
            horizontal: widget.paddingHorizontal),
        decoration: BoxDecoration(
            border: Border.all(
                width: widget.borderWidth, color: widget.borderWidthColor),
            borderRadius: new BorderRadius.circular(widget.borderRadius),
            color: renderButtonColor()),
        child: Text(
          widget.text,
          style: TextStyle(
              fontSize: widget.textSize,
              color: widget.colorText,
              fontWeight: widget.fontWeight),
        ),
      ),
    );
  }
}

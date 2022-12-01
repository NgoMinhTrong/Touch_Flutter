import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mafc_flutter/src/constants/colors.dart';
import 'package:mafc_flutter/src/utils/regex.dart';

class CustomTextInput extends StatefulWidget {
  final hintTextString;
  final TextEditingController? textEditController;
  final InputType? inputType;
  final Color? themeColor;
  final double? cornerRadius;
  final int? maxLength;
  final Widget? prefixIcon;
  final Color? textColor;
  final double? textSize;
  final String? errorMessage;
  final String? labelText;
  final double? labelSize;
  final Color? labelColor;
  final Color? borderColor;
  final Color? iconColor;

  const CustomTextInput({
    this.hintTextString,
    this.textEditController,
    this.inputType,
    this.themeColor,
    this.cornerRadius,
    this.maxLength,
    this.prefixIcon,
    this.textColor,
    this.errorMessage,
    this.labelText,
    this.borderColor,
    this.labelColor,
    this.labelSize,
    this.iconColor,
    this.textSize,
  });

  @override
  _CustomTextInputState createState() => _CustomTextInputState();
}

// input text state
class _CustomTextInputState extends State<CustomTextInput> {
  bool _isValidate = true;
  String validationMessage = '';
  bool visibility = false;
  int oldTextSize = 0;

  // UI rendering
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.stroke, width: 0),
          color: AppColors.white),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
      child: TextFormField(
        controller: widget.textEditController,
        decoration: InputDecoration(
          hintText: widget.hintTextString as String,
          errorText: _isValidate ? null : null,
          counterText: '',
          // border: getBorder(),
          border: InputBorder.none,
          labelText: widget.labelText ?? widget.hintTextString as String,
          labelStyle: getTextStyle(),
          prefixIcon: widget.prefixIcon == true ? getPrefixIcon() : null,
          suffixIcon: getSuffixIcon(),
        ),
        onChanged: checkValidation,
        keyboardType: getInputType(),
        obscureText: widget.inputType == InputType.Password && !visibility,
        maxLength: widget.maxLength ?? getMaxLength(),
        style: TextStyle(
            color: widget.textColor ?? Colors.black,
            fontSize: widget.textSize ?? 20,
            fontWeight: FontWeight.w500),
        inputFormatters: [getFormatter()],
      ),
    );
  }

  //get border of textinput filed
  OutlineInputBorder getBorder() {
    return OutlineInputBorder(
      borderRadius:
          BorderRadius.all(Radius.circular(widget.cornerRadius ?? 10.0)),
      borderSide:
          BorderSide(width: 1, color: widget.borderColor ?? AppColors.stroke),
      gapPadding: 1,
    );
  }

  // formatter on basis of textinput type
  TextInputFormatter getFormatter() {
    return TextInputFormatter.withFunction((oldValue, newValue) => newValue);
  }

  // text style for textinput
  TextStyle getTextStyle() {
    return TextStyle(
        color: widget.labelColor ?? Theme.of(context).primaryColor,
        fontSize: widget.labelSize ?? 20,
        fontWeight: FontWeight.w400);
  }

  // input validations
  void checkValidation(String textFieldValue) {
    if (widget.inputType == InputType.Default) {
      //default
      _isValidate = textFieldValue.isNotEmpty;
      validationMessage = widget.errorMessage ?? 'Filed cannot be empty';
    } else if (widget.inputType == InputType.Email) {
      //email validation
      _isValidate = Validation.email(textFieldValue);
      validationMessage = widget.errorMessage ?? 'Email is not valid';
    } else if (widget.inputType == InputType.Number) {
      //contact number validation
      _isValidate = Validation.number(textFieldValue);
      validationMessage = widget.errorMessage ?? "Number is not valid";
    } else if (widget.inputType == InputType.Phone) {
      //Phone validation
      _isValidate = Validation.phone(textFieldValue);
      validationMessage = widget.errorMessage ?? "Phone is not valid";
    } else if (widget.inputType == InputType.Password) {
      //password validation
      _isValidate = Validation.password(textFieldValue);
      validationMessage = widget.errorMessage ?? 'Password is not valid';
    }
    oldTextSize = textFieldValue.length;
    setState(() {});
  }

  // return input type for setting keyboard
  TextInputType getInputType() {
    switch (widget.inputType) {
      case InputType.Default:
        return TextInputType.text;

      case InputType.Email:
        return TextInputType.emailAddress;

      case InputType.Number:
        return TextInputType.number;

      case InputType.Phone:
        return TextInputType.phone;

      default:
        return TextInputType.text;
    }
  }

  // get max length of text
  int getMaxLength() {
    switch (widget.inputType) {
      case InputType.Default:
        return 36;

      case InputType.Email:
        return 36;

      case InputType.Number:
        return 10;

      case InputType.Phone:
        return 12;

      case InputType.Password:
        return 24;

      default:
        return 36;
    }
  }

  // get prefix Icon
  Icon getPrefixIcon() {
    switch (widget.inputType) {
      case InputType.Default:
        return Icon(
          Icons.person,
          color: widget.themeColor ?? Theme.of(context).primaryColor,
        );

      case InputType.Email:
        return Icon(
          Icons.email,
          color: widget.themeColor ?? Theme.of(context).primaryColor,
        );

      case InputType.Number:
        return Icon(
          Icons.phone,
          color: widget.themeColor ?? Theme.of(context).primaryColor,
        );

      case InputType.Phone:
        return Icon(
          Icons.phone,
          color: widget.themeColor ?? Theme.of(context).primaryColor,
        );

      case InputType.Password:
        return Icon(
          Icons.lock,
          color: widget.themeColor ?? Theme.of(context).primaryColor,
        );

      default:
        return Icon(
          Icons.person,
          color: widget.themeColor ?? Theme.of(context).primaryColor,
        );
    }
  }

  // get suffix icon
  Widget getSuffixIcon() {
    if (widget.inputType == InputType.Password) {
      return IconButton(
        onPressed: () {
          setState(() {
            visibility = !visibility;
          });
        },
        icon: Icon(
          visibility ? Icons.visibility : Icons.visibility_off,
          color: widget.iconColor ?? Theme.of(context).primaryColor,
          size: 20,
        ),
      );
    } else {
      return const Opacity(opacity: 0, child: Icon(Icons.phone));
    }
  }
}

//input types
enum InputType { Default, Email, Number, Password, Phone }

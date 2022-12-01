import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'buttonWidgets/customButton.dart';

class DialogConfirm extends StatelessWidget {
  String message;
  String txtCancel;
  String txtAccept;
  Function handle_cancel;
  Function handlePressed;

  DialogConfirm(
      {this.message = "Text Dialog Is Null",
      this.txtCancel = "Text null",
      this.txtAccept = "Text null",
      required this.handle_cancel,
      required this.handlePressed});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Container(
          padding: EdgeInsets.only(top: 45, bottom: 36, left: 20, right: 20),
          width: double.infinity,
          constraints: BoxConstraints(maxWidth: 380),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
              color: AppColors.blue120),
          child: Center(
              child: Column(
            children: [
              Text(message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12,
                      height: 1.5,
                      color: AppColors.textLabel,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.1)),
              SizedBox(height: 34),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(width: 1, color: Color(0xFF828282))),
                    child: CustomButton(
                      text: txtCancel,
                      textSize: 12,
                      handlePressed: handle_cancel,
                      color: Colors.white,
                      colorText: Color(0xFF828282),
                      fontWeight: FontWeight.w500,
                      borderRadius: 50,
                      paddingHorizontal: 23,
                    ),
                  ),
                  SizedBox(width: 20),
                  CustomButton(
                    text: txtAccept,
                    textSize: 12,
                    colorText: Colors.black,
                    fontWeight: FontWeight.w500,
                    borderRadius: 50,
                    handlePressed: handlePressed,
                    paddingHorizontal: 23,
                  )
                ],
              )
            ],
          )))
    ]);
  }
}

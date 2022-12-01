import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mafc_flutter/src/constants/colors.dart';
import 'package:mafc_flutter/src/controllers/loginController.dart';
import 'package:mafc_flutter/src/service/authenticationApi.dart';
import 'package:mafc_flutter/src/widgets/buttonWidgets/buttonPrimary.dart';
import 'package:mafc_flutter/src/widgets/buttonWidgets/touchableOpacity.dart';
import 'package:mafc_flutter/src/widgets/header/headerLogo.dart';
import 'package:mafc_flutter/src/widgets/input/input.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginController loginController = Get.put(LoginController());
  AuthenticationApi authenticationApi = Get.put(AuthenticationApi());
  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  bool checkEmail = false;
  bool checkPass = false;
  bool disableButton = true;

  void _textValue() {
    if (phoneController.text != '' && passwordController.text != '') {
      setState(() {
        disableButton = true;
      });
    } else {
      setState(() {
        disableButton = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    phoneController.text = '0987010852';
    passwordController.text = 'Aa@123123';
    phoneController.addListener(_textValue);
    passwordController.addListener(_textValue);
  }

  _handleLogin() async {
    await loginController.login('Developer5@gmail.com', '1234561');
  }

  @override
  Widget build(BuildContext context) {
    print('=======>>> ${phoneController.text} - ${passwordController.text}');
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderLogo(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Đăng nhập',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: AppColors.blue120),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomTextInput(
                        textEditController: phoneController,
                        hintTextString: '',
                        inputType: InputType.Phone,
                        borderColor: AppColors.stroke,
                        labelColor: AppColors.textLabel,
                        labelText: 'Số điện thoại',
                        labelSize: 16,
                        textSize: 20,
                        cornerRadius: 10.0,
                        maxLength: 10,
                        textColor: AppColors.blue140),
                    SizedBox(
                      height: 16,
                    ),
                    CustomTextInput(
                      textEditController: passwordController,
                      hintTextString: '',
                      inputType: InputType.Password,
                      borderColor: AppColors.stroke,
                      labelColor: AppColors.textLabel,
                      labelText: 'Mật khẩu',
                      labelSize: 16,
                      cornerRadius: 10.0,
                      maxLength: 18,
                      textColor: AppColors.blue140,
                      iconColor: AppColors.iconColor,
                    ),
                    SizedBox(
                      height: 69,
                    ),
                    ButtonPrimary(
                      handlePressed: () => _handleLogin(),
                      text: 'Đăng nhập',
                      active: disableButton,
                    ),
                    Container(
                      width: Get.width,
                      margin: EdgeInsets.only(top: 28),
                      child: TouchableOpacity(
                        onTap: () {},
                        child: Text(
                          'Quên mật khẩu',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blue80),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

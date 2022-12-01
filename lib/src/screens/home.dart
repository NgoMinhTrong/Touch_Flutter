import 'package:flutter/material.dart';
import 'package:mafc_flutter/src/models/login.dart';

class Home extends StatefulWidget {
  // LoginModel? _loginModel;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  LoginModel? _loginModel;
  @override
  Widget build(BuildContext context) {
    print('/////////////////////// ${_loginModel?.Email}');
    return Scaffold(
      body: SafeArea(
        child: Column(),
      ),
    );
  }
}

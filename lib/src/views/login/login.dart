import 'package:flutter/material.dart';
import 'package:mockup_one/src/components/appbars.dart';
import 'package:mockup_one/src/components/main_variable.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariablesType.backgroundColor,
      appBar: kDefaultAppBarGoBackOnly(context),
    );
  }
}
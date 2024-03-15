import 'package:flutter/material.dart';
import 'package:mockup_one/src/components/appbars.dart';
import 'package:mockup_one/src/components/buttons.dart';
import 'package:mockup_one/src/components/main_variable.dart';
import 'package:mockup_one/src/components/textfields.dart';
import 'package:mockup_one/src/helpers/focus_manager.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController password1 = TextEditingController();
  TextEditingController password2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: focusManager,
      child: Scaffold(
        backgroundColor: GlobalVariablesType.backgroundColor,
        appBar: kDefaultAppBarGoBackOnly(context, title: "Change Password"),
        body: SingleChildScrollView(
          padding: GlobalVariablesType.defaultPadding,
          child: Column(
            children: [
              PasswordTextField(
                controller: password1,
                hintText: "input your old password",
                labelText: "Old Password",
              ),
              const SizedBox(height: 10),
              PasswordTextField(
                controller: password1,
                hintText: "input your new password",
                labelText: "New Password",
              ),
              const SizedBox(height: 10),
              PasswordTextField(
                controller: password1,
                hintText: "Re-type new password",
                labelText: "Re-type new Password",
              ),
              const SizedBox(height: 30),
              SizedBox(
              width: MediaQuery.of(context).size.width,
              child: kDefaultButtonLogin(
                title: "Change Password",
                onPressed: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const MainPage()));
                },
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}
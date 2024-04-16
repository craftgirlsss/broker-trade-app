import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mockup_one/src/components/appbars.dart';
import 'package:mockup_one/src/components/buttons.dart';
import 'package:mockup_one/src/components/main_variable.dart';
import 'package:mockup_one/src/components/textfields.dart';
import 'package:mockup_one/src/components/textstyle.dart';
import 'package:mockup_one/src/helpers/focus_manager.dart';
import 'package:mockup_one/src/helpers/url_launchers.dart';
import 'package:mockup_one/src/views/login/otp.dart';

class RegisterAccountV2 extends StatefulWidget {
  const RegisterAccountV2({super.key});

  @override
  State<RegisterAccountV2> createState() => _RegisterAccountV2State();
}

class _RegisterAccountV2State extends State<RegisterAccountV2> {
  bool isChecked = false;
  TextEditingController emailContrller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  void dispose() {
    emailContrller.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => focusManager(),
      child: Scaffold(
        extendBodyBehindAppBar: false,
        backgroundColor: GlobalVariablesType.backgroundColor,
        appBar: kDefaultAppBarGoBackOnly(context),
        body: ListView(
          padding: GlobalVariablesType.defaultPadding,
          children: [
            const SizedBox(height: 20),
            Text("Register", style: kDefaultTextStyleSubtitleSplashScreen()),
            const SizedBox(height: 15),
            NameTextField(
              hintText: "Input your name",
              labelText: "Full Name",
              controller: nameController,
            ),
            const SizedBox(height: 15),
            UsernameTextFields(
              hintText: "Input your email",
              labelText: "Email",
              controller: emailContrller,
            ),
            const SizedBox(height: 15),
            PasswordTextField(
              controller: passwordController,
              hintText: "input your password",
              labelText: "Password",
            ),
            const SizedBox(height: 15),
            PasswordTextField(
              controller: confirmPasswordController,
              hintText: "input your password",
              labelText: "Confirm Password",
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      CupertinoCheckbox(
                        activeColor: GlobalVariablesType.buttonTextColor![3],
                        value: isChecked, 
                        onChanged: (bool? value){
                          setState(() {
                            isChecked = value!;
                          });
                        }),
                        GestureDetector(
                          onTap: (){
                            launchUrls(GlobalVariablesType.termsAndConditions);
                          },
                          child: Text(GlobalVariablesType.agreeText!, style: kDefaultTextStyleButtonText(color: GlobalVariablesType.mainColor),))
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: kDefaultButtonLogin(
                title: GlobalVariablesType.signUpText,
                onPressed: (){
                  Get.to(() => const OTPPage());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mockup_one/src/components/appbars.dart';
import 'package:mockup_one/src/components/buttons.dart';
import 'package:mockup_one/src/components/main_variable.dart';
import 'package:mockup_one/src/components/textfields.dart';
import 'package:mockup_one/src/components/textstyle.dart';
import 'package:mockup_one/src/helpers/focus_manager.dart';
import 'package:mockup_one/src/views/login/forgot.dart';
import 'package:mockup_one/src/views/login/sign_up.dart';
import 'package:mockup_one/src/views/mainpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailContrller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isChecked = false;
  @override
  void dispose() {
    emailContrller.dispose();
    passwordController.dispose();
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
            Text("LOGIN", style: kDefaultTextStyleSubtitleSplashScreen(color: Colors.black87)),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      CupertinoCheckbox(
                        activeColor: GlobalVariablesType.mainColor,
                        value: isChecked, 
                        onChanged: (bool? value){
                          setState(() {
                            isChecked = value!;
                          });
                        }),
                        Text(GlobalVariablesType.rememberMeText!, style: kDefaultTextStyleButtonText(color: GlobalVariablesType.mainColor),)
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.to(() => const ForgotPassword());
                  },
                  child: Text(GlobalVariablesType.forgotText!, style: kDefaultTextStyleButtonText(color: GlobalVariablesType.mainColor),),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: kDefaultButtonLogin(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MainPage()));
                },
              ),
            ),
            const SizedBox(height: 17),
            Center(
              child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPages()));
                    },
                    child: Text(GlobalVariablesType.buatAkunText!, style: kDefaultTextStyleCustom(color: GlobalVariablesType.mainColor, fontWeight: FontWeight.normal),),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
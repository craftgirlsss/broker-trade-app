import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mockup_one/src/components/appbars.dart';
import 'package:mockup_one/src/components/main_variable.dart';
import 'package:mockup_one/src/components/textfields.dart';
import 'package:mockup_one/src/components/textstyle.dart';
import 'package:mockup_one/src/helpers/focus_manager.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailContrller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool? checkBox = false;
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
        backgroundColor: GlobalVariablesType.backgroundColor,
        appBar: kDefaultAppBarGoBackOnly(context),
        body: ListView(
          padding: GlobalVariablesType.defaultPadding,
          children: [
            const SizedBox(height: 40),
            Text(GlobalVariablesType.ucapanLogin, style: kDefaultTextStyleSubtitleSplashScreen(color: Colors.black87)),
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
                  child: Row(
                    children: [
                      CupertinoCheckbox(
                        
                        value: checkBox, 
                        onChanged: (condition){
                          setState(() {
                            condition = !condition!;
                            condition = checkBox;
                          });
                        })
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: Text(GlobalVariablesType.forgotText!, style: kDefaultTextStyleButtonText(color: GlobalVariablesType.buttonTextColor![3]),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
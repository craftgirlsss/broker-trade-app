import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mockup_one/src/components/appbars.dart';
import 'package:mockup_one/src/components/buttons.dart';
import 'package:mockup_one/src/components/main_variable.dart';
import 'package:mockup_one/src/components/textfields.dart';
import 'package:mockup_one/src/components/textstyle.dart';
import 'package:mockup_one/src/helpers/focus_manager.dart';
import 'package:mockup_one/src/views/mainpage.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailContrller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController namaContrller = TextEditingController();
  TextEditingController noHPController = TextEditingController();
  bool isChecked = false;
  @override
  void dispose() {
    emailContrller.dispose();
    passwordController.dispose();
    namaContrller.dispose();
    noHPController.dispose();
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
            const SizedBox(height: 20),
            Text(GlobalVariablesType.ucapanSignUP, style: kDefaultTextStyleSubtitleSplashScreen(color: Colors.black87)),
            const SizedBox(height: 15),
            UsernameTextFields(
              hintText: "Input your name",
              labelText: "Name",
              controller: namaContrller,
            ),
            const SizedBox(height: 15),
            UsernameTextFields(
              hintText: "Input your phone",
              labelText: "Phone",
              controller: noHPController,
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
                        Text(GlobalVariablesType.agreeText!, style: kDefaultTextStyleButtonText(color: GlobalVariablesType.buttonTextColor![3]),)
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MainPage()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
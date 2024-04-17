import 'package:flutter/material.dart';
import 'package:mockup_one/src/components/appbars.dart';
import 'package:mockup_one/src/components/buttons.dart';
import 'package:mockup_one/src/components/main_variable.dart';
import 'package:mockup_one/src/components/textfields.dart';
import 'package:mockup_one/src/components/textstyle.dart';
import 'package:mockup_one/src/helpers/focus_manager.dart';
import 'package:mockup_one/src/views/mainpage.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailContrller = TextEditingController();

  @override
  void dispose() {
    emailContrller.dispose();
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
            Text(GlobalVariablesType.forgotText!, style: kDefaultTextStyleSubtitleSplashScreen(color: Colors.white)),
            const SizedBox(height: 10),
            Text("Input your email which registered on this platform, we will send password change request to your email", style: kDefaultTextStyleCustom()),
            const SizedBox(height: 15),
            UsernameTextFields(
              hintText: "Input your email",
              labelText: "Email",
              controller: emailContrller,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: kDefaultButtonLogin(
                title: GlobalVariablesType.submitText,
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
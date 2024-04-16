import 'package:flutter/material.dart';
import 'package:mockup_one/src/components/buttons.dart';
import 'package:mockup_one/src/components/main_variable.dart';
import 'package:mockup_one/src/components/textstyle.dart';
import 'package:mockup_one/src/helpers/focus_manager.dart';
import 'package:mockup_one/src/helpers/url_launchers.dart';
import 'package:mockup_one/src/views/login/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => focusManager(),
      child: Scaffold(
        backgroundColor: GlobalVariablesType.backgroundColor,
        // appBar: kDefaultAppBarTitle(),
        body: SafeArea(
          child : Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.only(left: GlobalVariablesType.paddingLeft, right: GlobalVariablesType.paddingRight, top: GlobalVariablesType.paddingTop, bottom: GlobalVariablesType.paddingBottom),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Text(GlobalVariablesType.titleSplashScreen!, style: kDefaultTextStyleTitleAppBar()),
                        const SizedBox(height: 5),
                        SizedBox(height: GlobalVariablesType.height),
                        Text(GlobalVariablesType.descriptionSplashScreen!, style: kDefaultTextStyleSubtitleSplashScreen(color: GlobalVariablesType.mainColor)),
                        const SizedBox(height: 20),
                        Image.asset('assets/images/splash-image.png')
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: kDefaultButtonLogin(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                          })),
                        TextButton(
                          onPressed: () => launchUrls(GlobalVariablesType.termsAndConditions),
                          child: Text(GlobalVariablesType.termsAndConditionsText, style: kDefaultTextStyleButtonText()) )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }
}
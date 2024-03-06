import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalVariablesType extends StatelessWidget{
  const GlobalVariablesType({super.key});
  
  // url untuk mengarahkan webview
  static String? urlWeb = "https://google.com";

  // url terms & conditions
  static String termsAndConditions = "https://google.com";

  // terms and condition text
  static String termsAndConditionsText = "Terms and Condition";

  // String nama aplikasi
  static String? nameApp = "App Name";

  // judul di page splash screen
  static String? titleSplashScreen = "Log in to your account";

  // deskripsi di page splashscreen
  static String? descriptionSplashScreen = "Trading Forex be easly with MBTC";

  // Teks Login
  static String? loginText = "LOGIN";

  // main color button semua screen
  static List<Color>? buttonSquereColor = [
    Colors.green.shade400.withOpacity(0.9),
    Colors.blue.shade400,
  ];

  // Elevation
  static double? elevation = 0;

  static String fontFamily = "Inter";
  
  // fontSize
  static double fontSizeTitleSmall12 = 12;
  static double fontSizeTitleMedium14 = 14;
  static double fontSizeTitleBig17 = 17;
  static double fontSizeTitleBig27 = 27;
 
  // main color text button semua screen
  static List<Color>? buttonTextColor = [
    Colors.black54,
    CupertinoColors.activeBlue,
    Colors.white,
    Colors.green.shade400,
  ];

  // main color text borderLineTextField semua screen
  static List<Color>? borderLineTextFieldColor = [
    Colors.green.shade400,
    CupertinoColors.activeBlue,
  ];
  
  // BackgroundColor all page
  static Color? backgroundColor = Colors.white;
  
  // Color of text black
  static List<Color?> colorTextBlack = [
    Colors.black,
    Colors.black54,
    Colors.black38
  ];
  // AutoImplyLeading
  static bool autoImplyLeadingAppBarFalse = false;
  static bool autoImplyLeadingAppBarTrue = true;

  // padding page
  static double paddingLeft = 20;
  static double paddingRight = 20;
  static double paddingTop = 15;
  static double paddingBottom = 0;

  // Spacing sizedbox
  static double height = 5;
  static double width = 5;
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

}

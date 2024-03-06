import 'package:flutter/material.dart';
import 'package:mockup_one/src/components/main_variable.dart';

TextStyle kDefaultTextStyleTitleAppBar(){
  return TextStyle(
    fontFamily: GlobalVariablesType.fontFamily,
    fontSize: GlobalVariablesType.fontSizeTitleMedium14,
    fontWeight: FontWeight.bold,
    color: GlobalVariablesType.colorTextBlack[0]
  );
}

TextStyle kDefaultTextStyleSubtitleSplashScreen(){
  return TextStyle(
    fontFamily: GlobalVariablesType.fontFamily,
    fontSize: GlobalVariablesType.fontSizeTitleBig27,
    fontWeight: FontWeight.normal,
    color: GlobalVariablesType.buttonSquereColor![0]
  );
}

TextStyle kDefaultTextStyleButton(){
  return TextStyle(
    fontFamily: GlobalVariablesType.fontFamily,
    fontSize: GlobalVariablesType.fontSizeTitleBig17,
    fontWeight: FontWeight.bold,
    color: GlobalVariablesType.buttonTextColor![2]
  );
}

TextStyle kDefaultTextStyleButtonText(){
  return TextStyle(
    fontFamily: GlobalVariablesType.fontFamily,
    fontSize: GlobalVariablesType.fontSizeTitleSmall12,
    fontWeight: FontWeight.normal,
    color: GlobalVariablesType.buttonTextColor![0]
  );
}
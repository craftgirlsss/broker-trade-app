import 'package:flutter/material.dart';
import 'package:mockup_one/src/components/main_variable.dart';

TextStyle kDefaultTextStyleTitleAppBar({double? fontSize, FontWeight? fontWeight}){
  return TextStyle(
    fontFamily: GlobalVariablesType.fontFamily,
    fontSize: fontSize ?? GlobalVariablesType.defaultFontSize,
    fontWeight: fontWeight ?? FontWeight.bold,
    color: GlobalVariablesType.colorTextBlack[0]
  );
}

TextStyle kDefaultTextStyleCustom({double? fontSize, FontWeight? fontWeight, Color? color}){
  return TextStyle(
    fontFamily: GlobalVariablesType.fontFamily,
    fontSize: fontSize ?? GlobalVariablesType.defaultFontSize,
    fontWeight: fontWeight ?? FontWeight.bold,
    color: color ?? GlobalVariablesType.mainTextColor
  );
}

TextStyle kDefaultTextStyleTitleAppBarBold({double? fontSize}){
  return TextStyle(
    fontFamily: GlobalVariablesType.fontFamilyBold,
    fontSize: fontSize ?? GlobalVariablesType.defaultFontSize,
    fontWeight: FontWeight.bold,
    color: GlobalVariablesType.colorTextBlack[0]
  );
}

TextStyle kDefaultTextStyleSubtitleSplashScreen({Color? color}){
  return TextStyle(
    fontFamily: GlobalVariablesType.fontFamily,
    fontSize: GlobalVariablesType.fontSizeTitleBig27,
    fontWeight: FontWeight.normal,
    color: color ?? GlobalVariablesType.mainTextColor
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

TextStyle kDefaultTextStyleButtonText({Color? color, FontWeight? fontWeight}){
  return TextStyle(
    fontFamily: GlobalVariablesType.fontFamily,
    fontSize: GlobalVariablesType.fontSizeTitleSmall12,
    fontWeight: fontWeight ?? FontWeight.normal,
    color: color ?? GlobalVariablesType.buttonTextColor![0]
  );
}
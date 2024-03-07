import 'package:flutter/material.dart';
import 'package:mockup_one/src/components/textstyle.dart';
import 'main_variable.dart';

AppBar kDefaultAppBarTitle({String? title}){
  return AppBar(
    elevation: GlobalVariablesType.elevation,
    backgroundColor: GlobalVariablesType.backgroundColor,
    automaticallyImplyLeading: GlobalVariablesType.autoImplyLeadingAppBarFalse,
    title: Text(GlobalVariablesType.titleSplashScreen!, style: kDefaultTextStyleTitleAppBar()),
  );
}

AppBar kDefaultAppBarGoBackOnly(context){
  return AppBar(
    elevation: GlobalVariablesType.elevation,
    backgroundColor: GlobalVariablesType.backgroundColor,
    leading: IconButton(
      onPressed: (){
        Navigator.pop(context);
      },
      icon:Icon(Icons.arrow_back_rounded, color: GlobalVariablesType.buttonTextColor![3],)),
  );
}
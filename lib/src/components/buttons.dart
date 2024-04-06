import 'package:flutter/material.dart';
import 'package:mockup_one/src/components/main_variable.dart';

import 'textstyle.dart';

ElevatedButton kDefaultButtonLogin({Function()? onPressed, String? title}){
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      backgroundColor: GlobalVariablesType.mainColor,
      elevation: 0
    ), 
    child: Text(title ?? GlobalVariablesType.loginText!, style: kDefaultTextStyleButton()));
}
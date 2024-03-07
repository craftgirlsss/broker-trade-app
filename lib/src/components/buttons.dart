import 'package:flutter/material.dart';
import 'package:mockup_one/src/components/main_variable.dart';

import 'textstyle.dart';

ElevatedButton kDefaultButtonLogin({Function()? onPressed}){
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      backgroundColor: GlobalVariablesType.buttonSquereColor![0],
      elevation: 1,
    ), 
    child: Text(GlobalVariablesType.loginText!, style: kDefaultTextStyleButton()));
}
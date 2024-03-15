import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mockup_one/src/components/textstyle.dart';

alertDialogSignOut(context){
  return Get.defaultDialog(
    radius: 30,
    barrierDismissible: true,
    title: "",
    content: Column(
      children: [
        Lottie.asset('assets/json/close.json', repeat: false),
        Text("Sign Out", style: kDefaultTextStyleTitleAppBar(fontSize: 16, fontWeight: FontWeight.bold),),
        const SizedBox(height: 5),
        Text("Are you sure to sign out from your account?", style: kDefaultTextStyleTitleAppBar(fontSize: 13, fontWeight: FontWeight.normal),)
      ],
    ),
    actions: [
      SizedBox(
        width: 100,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            elevation: 5,
            backgroundColor: Colors.red
          ),
          onPressed: (){
            Navigator.pop(context);
          }, 
        child: Text("Yes", style: kDefaultTextStyleCustom(color: Colors.white
        ))),
      ),
    ]
  );
}
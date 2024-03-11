import 'package:flutter/cupertino.dart';
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

AppBar appBarHomePage(context, {String? name, String? urlPhoto, Function()? onPressedNotification, Function()? onPressedProfile}){
  return AppBar(
    backgroundColor: GlobalVariablesType.backgroundColor,
    leadingWidth: 60,
    leading: Padding(
      padding: const EdgeInsets.only(left: 12),
      child: GestureDetector(
        onTap: onPressedProfile,
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            shape: BoxShape.circle,
            image: urlPhoto != null ? DecorationImage(image: NetworkImage(urlPhoto), fit: BoxFit.cover) : const DecorationImage(image: AssetImage('assets/images/default-picture.png'), fit: BoxFit.cover)
          ),
        ),
      ),
    ),
    title: GestureDetector(
      onTap: onPressedProfile,
      child: Text(name ?? "Saputra Budianto", style: kDefaultTextStyleTitleAppBar(fontSize: 17))),
    actions: [
      IconButton(
        onPressed: onPressedNotification, 
        icon: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.14),
            shape: BoxShape.circle
          ),
          child: Icon(CupertinoIcons.bell_solid, 
          color: GlobalVariablesType.buttonTextColor![1],),
        ))
    ],
  );
}
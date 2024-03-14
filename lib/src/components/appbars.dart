import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mockup_one/src/components/textstyle.dart';
import 'main_variable.dart';

AppBar kDefaultAppBarTitle({String? title, double? fontSize, bool? centerTitle}){
  return AppBar(
    elevation: GlobalVariablesType.elevation,
    centerTitle: centerTitle ?? false,
    backgroundColor: GlobalVariablesType.backgroundColor,
    automaticallyImplyLeading: GlobalVariablesType.autoImplyLeadingAppBarFalse,
    title: Text(title ?? GlobalVariablesType.titleSplashScreen!, style: kDefaultTextStyleTitleAppBar(fontSize: fontSize)),
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


class AppBarHomePage extends StatefulWidget {
  final String? urlImage;
  const AppBarHomePage({super.key, this.urlImage});

  @override
  State<AppBarHomePage> createState() => _AppBarHomePageState();
}

class _AppBarHomePageState extends State<AppBarHomePage> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return AppBar(
    backgroundColor: GlobalVariablesType.backgroundColor,
    leadingWidth: 60,
    elevation: 0,
    leading: Padding(
      padding: const EdgeInsets.only(left: 12),
      child: GestureDetector(
        onTap: (){},
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            // color: Colors.grey.withOpacity(0.2),
            color: Colors.transparent,
            shape: BoxShape.circle,
            image: widget.urlImage != null ? DecorationImage(image: NetworkImage(widget.urlImage!), fit: BoxFit.cover) : const DecorationImage(image: AssetImage('assets/images/default-picture.png'), fit: BoxFit.cover)
          ),
        ),
      ),
    ),
    title: GestureDetector(
      onTap: (){},
      child: Text("Saputra Budianto", style: kDefaultTextStyleTitleAppBar(fontSize: 17))),
    actions: [
      Stack(
        children: [
          IconButton(
            onPressed: (){
              setState(() {
                counter = counter + 1;
              });
              print(counter);
            }, 
            icon: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.14),
                shape: BoxShape.circle
              ),
              child: Icon(CupertinoIcons.bell_solid, 
              color: GlobalVariablesType.buttonTextColor![1],),
            )),
          counter != 0 ? Positioned(
                right: 11,
                top: 11,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: Text(
                    '$counter',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ) : Container()
        ],
      )
    ],
  );
  }
}


AppBar appBarHomePage(context, {String? name, String? urlPhoto, Function()? onPressedNotification, Function()? onPressedProfile, bool availableNotofication = false}){
  return AppBar(
    surfaceTintColor: Colors.transparent,
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
            // color: Colors.grey.withOpacity(0.2),
            color: Colors.transparent,
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
      Stack(
        children: [
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
                ),
            ),
          availableNotofication ? Positioned(
            right: 12,
            top: 12,
            child: Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
            ),
          ) : Container()
        ],
      ),
    ],
  );
}
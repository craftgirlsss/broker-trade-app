import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mockup_one/src/components/action_sheet.dart';
import 'package:mockup_one/src/components/appbars.dart';
import 'package:mockup_one/src/components/buttons.dart';
import 'package:mockup_one/src/components/main_variable.dart';
import 'package:mockup_one/src/components/textfields.dart';
import 'package:mockup_one/src/components/textstyle.dart';
import 'package:mockup_one/src/helpers/focus_manager.dart';

class DetailProfile extends StatefulWidget {
  const DetailProfile({super.key});

  @override
  State<DetailProfile> createState() => _DetailProfileState();
}

class _DetailProfileState extends State<DetailProfile> {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: focusManager,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: kDefaultAppBarGoBackOnly(context, title: GlobalVariablesType.profileku),
        body: SingleChildScrollView(
          padding: GlobalVariablesType.defaultPadding,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.transparent,
                  child: Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.05),                      
                          image: const DecorationImage(image: AssetImage('assets/images/default-picture.png'), fit: BoxFit.cover)
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: (){
                            debugPrint("Ditekan");
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: GlobalVariablesType.mainColor
                            ),
                            child: const Icon(CupertinoIcons.camera, color: Colors.white,),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text("Saputra Budianto", textAlign: TextAlign.center, style: kDefaultTextStyleCustom(fontSize: 18, fontWeight: FontWeight.bold)),
                const Text("nextjies@icloud.com", textAlign: TextAlign.center),
                const SizedBox(height: 20),
                NameTextField(
                  controller: nameController,
                  hintText: "First Name",  
                ),
                NameTextField(
                  controller: nameController,
                  hintText: "Last Name",  
                ),
                PhoneTextField(
                  controller: nameController,
                  hintText: "Phone",  
                ),
                TextEditingOptionSelect(
                  
                  controller: nameController,
                  hintText: "Select Gender",
                  onTap: (){
                    showCupertinoActionSheet(context, 
                    message: "Choose your gender",
                    title: "Gender",
                    cupertinoActionSheet: [
                      CupertinoActionSheetAction(
                        onPressed: (){
                          Navigator.pop(context);
                        }, 
                        child: const Text("Laki - Laki")),
                      CupertinoActionSheetAction(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: const Text("Perempuan")),
                    ]);
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 20,
                  child: kDefaultButtonLogin(
                    onPressed: (){},
                    title: "UPDATE"
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
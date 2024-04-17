import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  TextEditingController accountIDController = TextEditingController();
  TextEditingController demoAccountIDController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  // Image Picker from gallery
  XFile? _imageFile;
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = pickedFile;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: focusManager,
      child: Scaffold(
        backgroundColor: GlobalVariablesType.backgroundColor,
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
                          image: _imageFile == null ? const DecorationImage(image: AssetImage('assets/images/empty_image.png'), fit: BoxFit.cover) : DecorationImage(image: FileImage(File(_imageFile!.path)), fit: BoxFit.cover)
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: (){
                            pickImage();
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
                const SizedBox(height: 15),
                Text("Saputra Budianto", textAlign: TextAlign.center, style: kDefaultTextStyleCustom(fontSize: 16, fontWeight: FontWeight.bold)),
                Text("nextjies@icloud.com", textAlign: TextAlign.center, style: kDefaultTextStyleCustom(color: Colors.white, fontWeight: FontWeight.normal),),
                const SizedBox(height: 20),
                NameTextField(
                  controller: nameController,
                  hintText: "Account ID",  
                ),
                NameTextField(
                  controller: nameController,
                  hintText: "Demo Account ID",  
                ),
                NameTextField(
                  controller: nameController,
                  hintText: "Full Name",  
                ),
                PhoneTextField(
                  controller: nameController,
                  hintText: "Phone",  
                ),
                TextEditingOptionSelect(
                  hintText: "Select Gender",
                  controller: genderController,
                  onTap: () => showCupertinoActionSheet(
                    context, 
                    cupertinoActionSheet: [
                      CupertinoActionSheetAction(
                        onPressed: (){
                          setState(() {
                            genderController.text = "Male";
                          });
                          Navigator.pop(context);
                        }, 
                        child: const Text("Male")
                      ),
                      CupertinoActionSheetAction(
                        onPressed: (){
                          setState(() {
                            genderController.text = "Female";
                          });
                          Navigator.pop(context);
                        }, 
                        child: const Text("Female")
                      ),
                  ],
                  message: "Choose Your Gender",
                  title: "Gender"),
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
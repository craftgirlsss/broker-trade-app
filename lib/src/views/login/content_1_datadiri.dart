import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mockup_one/src/components/action_sheet.dart';
import 'package:mockup_one/src/components/main_variable.dart';
import 'package:mockup_one/src/components/textfields.dart';
import 'package:mockup_one/src/components/textstyle.dart';

class Content1 extends StatefulWidget {
  const Content1({super.key});

  @override
  State<Content1> createState() => _Content1State();
}

class _Content1State extends State<Content1> {
  TextEditingController emailContrller = TextEditingController();
  TextEditingController referalCodeController = TextEditingController();
  TextEditingController idPersonalController = TextEditingController();
  TextEditingController fullNameContrller = TextEditingController();
  TextEditingController genderContrller = TextEditingController();
  TextEditingController noHPController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: GlobalVariablesType.defaultPadding!,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text("Personal Information", style: kDefaultTextStyleCustom(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
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
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white10,
                    image: DecorationImage(image: AssetImage('assets/images/default-picture.png'), fit: BoxFit.cover)
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
                      child: const Icon(CupertinoIcons.camera, color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          NameTextField(
            hintText: "Input your name",
            labelText: "Full Name",
            controller: fullNameContrller,
          ),
          const SizedBox(height: 15),
          UsernameTextFields(
            hintText: "Input your email",
            labelText: "Email",
            controller: emailContrller,
          ),
          const SizedBox(height: 15),
          PhoneTextField(
            hintText: "Input your Phone Number",
            labelText: "Phone",
            controller: noHPController,
          ),
          const SizedBox(height: 15),
          TextEditingOptionSelect(
            hintText: "Select Gender",
            labelText: "Gender",
            controller: genderContrller,
            onTap: () => showCupertinoActionSheet(
              context, 
              cupertinoActionSheet: [
                CupertinoActionSheetAction(
                  onPressed: (){
                    setState(() {
                      genderContrller.text = "Male";
                    });
                    Navigator.pop(context);
                  }, 
                  child: const Text("Male")
                ),
                CupertinoActionSheetAction(
                  onPressed: (){
                    setState(() {
                      genderContrller.text = "Female";
                    });
                    Navigator.pop(context);
                  }, 
                  child: const Text("Female")
                ),
            ],
            message: "Choose Your Gender",
            title: "Gender"),
          ),
          const SizedBox(height: 15),
          TextEditingOptionSelect(
            controller: birthDateController,
            labelText: "Birth Date",
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime(2000), //get today's date
                firstDate:DateTime(1960), //DateTime.now() - not to allow to choose before today.
                lastDate: DateTime.now()
              );
              if(pickedDate != null ){                      
                String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                setState(() {
                    birthDateController.text = formattedDate; //set foratted date to TextField value. 
                });
              }else{
                  Get.snackbar("Failed", "Please choose your birthdate");
              }
            },
          ),
          const SizedBox(height: 15),
          AnyTextField(
            hintText: "ID Personal or NIK",
            labelText: "ID Personal or NIIK",
            withLength: true,
            maxLength: 16,
            textInputType: TextInputType.number,
            controller: idPersonalController,
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
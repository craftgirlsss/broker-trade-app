import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mockup_one/src/components/list_bank.dart';
import 'package:mockup_one/src/components/main_variable.dart';
import 'package:mockup_one/src/components/textfields.dart';
import 'package:mockup_one/src/components/textstyle.dart';

class Content3 extends StatefulWidget {
  const Content3({super.key});

  @override
  State<Content3> createState() => _Content3State();
}

class _Content3State extends State<Content3> {
  TextEditingController relationFamilyNameController = TextEditingController();
  TextEditingController phoneRelationFamilyController = TextEditingController();
  TextEditingController relationStatusController = TextEditingController();

  @override
  void dispose() {
    relationFamilyNameController.dispose();
    phoneRelationFamilyController.dispose();
    relationStatusController.dispose();
    super.dispose();
  }
  int initialItem = 6;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: GlobalVariablesType.defaultPadding!,
      child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text("Additional Information", style: kDefaultTextStyleCustom(fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            NameTextField(
              controller: relationFamilyNameController,
              labelText: "Emergency Contact Name",
              hintText: "Emergency Contact Name",
            ),
            const SizedBox(height: 10),
            TextEditingOptionSelect(
              hintText: "Emergency Contact Status",
              labelText: "Emergency Contact Status",
              controller: relationStatusController,
              onTap: (){
                showModalBottomSheet(
                  context: context, 
                  builder: (context) => 
                    CupertinoPicker(
                      itemExtent: 50,
                      diameterRatio: 5,
                      backgroundColor: CupertinoColors.darkBackgroundGray,
                      useMagnifier: true,
                      scrollController: FixedExtentScrollController(initialItem: initialItem),
                      onSelectedItemChanged: (index) {
                        setState(() {
                          initialItem = index;
                          relationStatusController.text = listBank[index];
                        },
                      );
                  },
                  children: List.generate(
                    listBank.length,
                    (index) => Center(
                          child: Text(
                            listBank[index],
                            style: kDefaultTextStyleCustom(fontSize: 12),
                          ),
                        ),
                      ),
                    )
                  );
                
              }
            ),
            const SizedBox(height: 15),
            PhoneTextField(
              hintText: "Emergency Contact Number",
              labelText: "Emergency Contact Number",
              controller: phoneRelationFamilyController,
            ),
            const SizedBox(height: 15),
          ],
        ),
    );
  }
}
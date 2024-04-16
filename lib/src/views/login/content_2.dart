import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mockup_one/src/components/list_bank.dart';
import 'package:mockup_one/src/components/main_variable.dart';
import 'package:mockup_one/src/components/textfields.dart';
import 'package:mockup_one/src/components/textstyle.dart';

class Content2 extends StatefulWidget {
  const Content2({super.key});

  @override
  State<Content2> createState() => _Content2State();
}

class _Content2State extends State<Content2> {
  TextEditingController bankNameController = TextEditingController();
  TextEditingController bankAccountController = TextEditingController();
  int initialItem = 6;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: GlobalVariablesType.defaultPadding!,
      child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text("Payment Information", style: kDefaultTextStyleCustom(fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            TextEditingOptionSelect(
              hintText: "Bank Name",
              labelText: "Bank Name",
              controller: bankNameController,
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
                          bankNameController.text = listBank[index];
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
            AnyTextField(
              hintText: "Bank Account Number",
              labelText: "Bank Account Number",
              textInputType: TextInputType.number,
              controller: bankAccountController,
            ),
            const SizedBox(height: 15),
          ],
        ),
    );
  }
}
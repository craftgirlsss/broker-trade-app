import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mockup_one/src/components/alerts.dart';
import 'package:mockup_one/src/components/appbars.dart';
import 'package:mockup_one/src/components/main_variable.dart';
import 'package:mockup_one/src/components/textstyle.dart';

import 'change_password.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariablesType.backgroundColor,
      appBar: kDefaultAppBarTitle(
        centerTitle: true,
        fontSize: 16,
        title: "My Information"
      ),
      body: SingleChildScrollView(
        padding: GlobalVariablesType.defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              elevation: 1,
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                tileColor: Colors.white,
                leading: Container(
                  width: 45,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage('assets/images/default-picture.png'))
                  ),
                ),
                title: Text("Saputra Budianto", style: kDefaultTextStyleTitleAppBar(fontSize: 17)),
                subtitle: Text(GlobalVariablesType.showProfile, style: kDefaultTextStyleButtonText(color: Colors.black54),),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 20), 
              ),
            ),
            const SizedBox(height: 20),
            CupertinoListSection(
              backgroundColor: Colors.transparent,
            additionalDividerMargin: 0,
            margin: const EdgeInsets.all(0),
            topMargin: 0,
            header: Text("Account settings", 
              style: kDefaultTextStyleTitleAppBarBold(fontSize: 19)),
            hasLeading: false,
            children: [
              CupertinoListTile(
                onTap: (){
                  Get.to(() => const ChangePasswordPage());
                },
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                leading: const Icon(CupertinoIcons.pencil_ellipsis_rectangle),
                title: const Text("Change Password")),
              CupertinoListTile(
                onTap: (){},
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                leading: const Icon(CupertinoIcons.tray_arrow_down),
                title: const Text("Deposit")),
              CupertinoListTile(
                onTap: (){},
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                leading: const Icon(CupertinoIcons.tray_arrow_up),
                title: const Text("Withdraw")),
              CupertinoListTile(
                onTap: (){},
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                leading: const Icon(CupertinoIcons.lock_shield),
                title: const Text("Privacy and Policy")),
              CupertinoListTile(
                onTap: (){},
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                leading: const Icon(CupertinoIcons.exclamationmark_bubble),
                title: const Text("Need help?")),
              CupertinoListTile(
                onTap: (){
                  alertDialogSignOut(context);
                },
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                leading: const Icon(CupertinoIcons.rectangle_expand_vertical),
                title: const Text("Sign Out")),
            ],
          ),
          ],
        ),
      ),
    );
  }
}
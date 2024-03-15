import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mockup_one/src/components/appbars.dart';
import 'package:mockup_one/src/components/card_portofolio.dart';
import 'package:mockup_one/src/components/main_variable.dart';
import 'package:mockup_one/src/components/textstyle.dart';

import 'notification_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: GlobalVariablesType.backgroundColor,
          appBar: appBarHomePage(context, onPressedNotification: () {Get.to(() => const NotificationPage());}, onPressedProfile: (){}, availableNotofication: true),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const CardPortofolio(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Assets", style: kDefaultTextStyleTitleAppBar(fontSize: 17),),
                      CupertinoButton(onPressed: (){}, child: const Text("See All")),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) => ListTile(
                      title: Text("EURO / USD", style: kDefaultTextStyleTitleAppBar(fontSize: 15)),
                      subtitle: Text("EURUSD", style: kDefaultTextStyleTitleAppBar(fontSize: 13, fontWeight: FontWeight.normal)),
                      leading: Image.asset('assets/icons/flags/eurusd.png', width: 55),
                      trailing: Column(
                        children: [
                          Text("\$119.83", style: kDefaultTextStyleTitleAppBar(fontSize: 15)),
                          Text("+3.2%", style: kDefaultTextStyleButtonText(color: Colors.red, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

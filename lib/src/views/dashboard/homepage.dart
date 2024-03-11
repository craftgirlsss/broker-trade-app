import 'package:flutter/material.dart';
import 'package:mockup_one/src/components/appbars.dart';
import 'package:mockup_one/src/components/card_portofolio.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarHomePage(context, onPressedNotification: (){}, onPressedProfile: (){}),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            CardPortofolio()
          ],
        ),
      ),
    );
  }
}

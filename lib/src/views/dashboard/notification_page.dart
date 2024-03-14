import 'package:flutter/material.dart';
import 'package:mockup_one/src/components/appbars.dart';
import 'package:mockup_one/src/components/main_variable.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariablesType.backgroundColor,
      appBar: kDefaultAppBarGoBackOnly(context),
      body: ListView.separated(
        padding: GlobalVariablesType.defaultPadding,
        itemCount: 2,
        itemBuilder: (context, index) => ListTile(
          tileColor: Colors.amber,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)),
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 5),
      ),
    );
  }
}
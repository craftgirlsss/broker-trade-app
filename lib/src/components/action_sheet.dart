import 'package:flutter/cupertino.dart';

void showCupertinoActionSheet(BuildContext context, {
  String? title,
  String? message,
  List<CupertinoActionSheetAction>? cupertinoActionSheet
}) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: Text(title ?? ''),
        message: Text(message ?? ''),
        actions: cupertinoActionSheet,
      ),
    );
  }
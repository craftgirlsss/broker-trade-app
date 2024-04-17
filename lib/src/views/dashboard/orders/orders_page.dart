import 'package:flutter/material.dart';
import 'package:mockup_one/src/components/main_variable.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariablesType.backgroundColor,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mockup_one/src/components/main_variable.dart';
import 'package:mockup_one/src/views/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mockup Trading App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: GlobalVariablesType.buttonTextColor![1]),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black
      ),
      child: GetMaterialApp(
        title: 'Mockup Trading App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
          color:  Colors.white,
        ),
          colorScheme: ColorScheme.fromSeed(seedColor: GlobalVariablesType.buttonTextColor![1]),
          useMaterial3: false,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

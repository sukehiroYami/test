import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/first_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //title: 'Palindrome App',
      home: FirstScreen(),
    );
  }
}

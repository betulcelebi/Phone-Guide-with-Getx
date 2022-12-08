import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_guide_book_getx/view/add_person_screen.dart';
import 'package:phone_guide_book_getx/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:velia_app/my_order_page.dart';
// import 'package:velia_app/detail_kamar_page.dart';
// import 'package:velia_app/home_page.dart';
// import 'package:velia_app/payment_page.dart';

import 'welcome_page.dart';
import 'home_page.dart';
// import 'create_account_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Velia Hotel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headlineLarge: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.normal),
        ),
      ),
      home: WelcomePage(),
    );
  }
}
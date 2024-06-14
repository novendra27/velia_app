import 'package:flutter/material.dart';

import 'welcome_page.dart';
// import 'create_account_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Memastikan penggunaan 'const' yang benar

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
import 'package:flutter/material.dart';
import 'views/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Velia Hotel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.normal),
        ),
      ),
      home: const WelcomePage(),
    );
  }
}
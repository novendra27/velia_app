import 'package:flutter/material.dart';

import 'views/pages/room_detail_page.dart';
import 'views/pages/welcome_page.dart';

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
      home: RoomDetailPage(),
    );
  }
}
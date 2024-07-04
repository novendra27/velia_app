import 'package:flutter/material.dart';
import 'package:velia_app/views/pages/home_page.dart';

class BookingConfirmedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        title: Text(
          'Booking Confirmed',
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline_rounded, color: Colors.black, size: 150),
            SizedBox(height: 20),
            Text(
              'Booking confirmed!',
              style: TextStyle(fontFamily: 'Urbanist', fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'our order was placed successfully for more details check delivery status.',
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'Urbanist', fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

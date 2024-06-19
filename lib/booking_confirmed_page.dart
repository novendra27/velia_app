import 'package:flutter/material.dart';

class BookingConfirmedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Confirmed', style: TextStyle(fontFamily: 'Urbanist')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline_rounded, color: Colors.black, size: 150),
            SizedBox(height: 20),
            Text(
              'Your booking is confirmed!',
              style: TextStyle(fontFamily: 'Urbanist', fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Thank you for booking with Velia Hotel.',
              style: TextStyle(fontFamily: 'Urbanist', fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

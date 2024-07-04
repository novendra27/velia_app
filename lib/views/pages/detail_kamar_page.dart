import 'package:flutter/material.dart';

import 'home_page.dart';
import 'payment_page.dart';

class DetailKamar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(
                bottom: 80), // Adding padding for the bottom button
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                      child: Image.asset(
                          'assets/images/detail_kamar.jpg'), // Placeholder image
                    ),
                    Positioned(
                      top: 40,
                      left: 10,
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                              );
                            },
                          ),
                          Text(
                            'Back',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Urbanist',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildInfoBox(Icons.wifi, 'Free Wifi'),
                            SizedBox(width: 16),
                            _buildInfoBox(Icons.local_dining, 'Free Breakfast'),
                            SizedBox(width: 16),
                            _buildInfoBox(Icons.star, '5.0',
                                iconColor: Colors.yellow),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Pelece Hotel',
                            style: TextStyle(
                              fontFamily: 'Urbanist',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$200.0',
                            style: TextStyle(
                              fontFamily: 'Urbanist',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 16, color: Colors.grey),
                          SizedBox(width: 4),
                          Text(
                            'Bali',
                            style: TextStyle(
                              fontFamily: 'Urbanist',
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      Text(
                        'Description',
                        style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Hotel Saudagar, Pune: See traveller reviews, 2 user photos and best deals for... enjoy stay here, you will find great bars and restaurants near the hotel.',
                        style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 35),
                      Text(
                        'Preview',
                        style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Navigate to another room detail
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset('assets/images/preview1.jpg',
                                  width: 100, height: 100), // Placeholder image
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigate to another room detail
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset('assets/images/preview2.jpg',
                                  width: 100, height: 100), // Placeholder image
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigate to another room detail
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset('assets/images/preview3.jpg',
                                  width: 100, height: 100), // Placeholder image
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(15.0),
              color: Colors.white,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaymentPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 130.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    'Booking Now',
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBox(IconData icon, String text,
      {Color iconColor = Colors.black}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
      decoration: BoxDecoration(
        color: Color(0xFFF5F5FF),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor),
          SizedBox(width: 8),
          Text(text, style: TextStyle(fontFamily: 'Urbanist')),
        ],
      ),
    );
  }
}

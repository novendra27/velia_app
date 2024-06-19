import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velia_app/booking_confirmed_page.dart';
import 'package:velia_app/detail_kamar_page.dart';

class PaymentPage extends StatelessWidget {
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
              MaterialPageRoute(builder: (context) => DetailKamar()),
            );
          },
        ),
        title: Text(
          'Payment',
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '9 Sep  ',
                          style: TextStyle(
                            fontFamily: 'Urbanist',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(FontAwesomeIcons.clock),
                        Text(
                          '  10 Sep',
                          style: TextStyle(
                            fontFamily: 'Urbanist',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Sylhet | 2 PM To 5 AM | Economy',
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            _buildSectionTitle('Payment Method'),
            SizedBox(height: 10),
            _buildRoundedContainer(
              child: Row(
                children: [
                  Icon(FontAwesomeIcons.google, color: Colors.black),
                  SizedBox(width: 10),
                  Text('Google Pay', style: TextStyle(fontFamily: 'Urbanist')),
                ],
              ),
            ),
            SizedBox(height: 20),
            _buildSectionTitle('Guests & Rooms'),
            SizedBox(height: 10),
            _buildRoundedContainer(
              child: Row(
                children: [
                  Text('1 room, 4 persons',
                      style: TextStyle(fontFamily: 'Urbanist')),
                ],
              ),
            ),
            SizedBox(height: 20),
            _buildSectionTitle('Coupon code'),
            SizedBox(height: 10),
            _buildRoundedContainer(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter Your Coupon Code',
                  border: InputBorder.none,
                  hintStyle: TextStyle(fontFamily: 'Urbanist'),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Text(
                    'Price Details',
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(184, 245, 245, 245),
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.grey, width: 2.0),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          _buildPriceDetail('Price', '\$200.00'),
                          _buildPriceDetail('After Discount', '\$160.00'),
                          _buildPriceDetail('Tax', '\$25.00'),
                          _buildPriceDetail('Total Price', '\$185.00'),
                          SizedBox(height: 10),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Navigate to Booking Confirmed page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BookingConfirmedPage()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 15.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Text(
            'Confirm',
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'Urbanist',
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildRoundedContainer({required Widget child}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 17.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(184, 245, 245, 245),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: child,
    );
  }

  Widget _buildPriceDetail(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:velia_app/detail_kamar_page.dart';

import 'search_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Search functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Notifications functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Let Explore the world!',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // Flight booking functionality
                    },
                    child: Text(
                      'Flight booking',
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Hotel booking functionality
                    },
                    child: Text(
                      'Hotel booking',
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Bali',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                      ),
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        color: Colors.black,
                      ),
                    ),
                    Divider(color: Colors.grey),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: '9/8/2024',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(10),
                              prefixIcon: Icon(Icons.calendar_today),
                            ),
                            style: TextStyle(
                              fontFamily: 'Urbanist',
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          child: VerticalDivider(color: Colors.grey),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: '16/8/2024',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(10),
                              prefixIcon: Icon(Icons.calendar_today),
                            ),
                            style: TextStyle(
                              fontFamily: 'Urbanist',
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(color: Colors.grey),
                    TextField(
                      decoration: InputDecoration(
                        labelText: '1 room, 4 person',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                      ),
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to Search Hotels Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 121.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    'Search Hotels',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Urbanist',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Special offer',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 190,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SpecialOfferCard(),
                    SpecialOfferCard(),
                    SpecialOfferCard(),
                    SpecialOfferCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Add your functionality here
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailKamar()),
        );
      },
      child: Container(
        width: 160,
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage('assets/images/detail_kamar.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Pelece Hotel\n\$200.00',
                  style: TextStyle(
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Color.fromARGB(150, 0, 0, 0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  '20% Off',
                  style: TextStyle(
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

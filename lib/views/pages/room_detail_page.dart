import 'package:flutter/material.dart';
import 'payment_page.dart';

class RoomDetailPage extends StatelessWidget {
  final String hotelName;
  final String hotelCity;
  final String hotelDescription;
  final int hotelPrice;
  final String hotelImage;

  const RoomDetailPage({
    super.key,
    required this.hotelName,
    required this.hotelCity,
    required this.hotelDescription,
    required this.hotelPrice,
    required this.hotelImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 80),
            child: Column(
              children: [
                HeroImage(hotelImage: hotelImage),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HotelFacilities(),
                      const SizedBox(height: 20),
                      HotelText(
                        hotelName: hotelName,
                        hotelPrice: hotelPrice,
                        hotelCity: hotelCity,
                        hotelDescription: hotelDescription,
                      ),
                      const SizedBox(height: 8),
                      const RoomDetail(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          BottomNavBar(
            hotelName: hotelName,
            hotelCity: hotelCity,
            hotelPrice: hotelPrice,
          ),
        ],
      ),
    );
  }
}

class HotelText extends StatelessWidget {
  const HotelText({
    super.key,
    required this.hotelName,
    required this.hotelPrice,
    required this.hotelCity,
    required this.hotelDescription,
  });

  final String hotelName;
  final int hotelPrice;
  final String hotelCity;
  final String hotelDescription;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              hotelName,
              style: const TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '\$$hotelPrice',
              style: const TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.location_on, size: 16, color: Colors.grey),
            const SizedBox(width: 4),
            Text(
              hotelCity,
              style: const TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
        const Text(
          'Description',
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          hotelDescription,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 35),
        const Text(
          'Preview',
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class RoomDetail extends StatelessWidget {
  const RoomDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            // Navigate to another room detail
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              'assets/images/preview1.jpg',
              width: 100,
              height: 100,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            // Navigate to another room detail
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              'assets/images/preview2.jpg',
              width: 100,
              height: 100,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            // Navigate to another room detail
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset('assets/images/preview3.jpg',
                width: 100, height: 100),
          ),
        ),
      ],
    );
  }
}

class BottomNavBar extends StatelessWidget {
  final String hotelName;
  final String hotelCity;
  final int hotelPrice;

  const BottomNavBar({
    super.key,
    required this.hotelName,
    required this.hotelCity,
    required this.hotelPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
                MaterialPageRoute(
                  builder: (context) => PaymentPage(
                    hotelName: hotelName,
                    hotelCity: hotelCity,
                    hotelPrice: hotelPrice,
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 130.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: const Text(
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
    );
  }
}

class HotelFacilities extends StatelessWidget {
  const HotelFacilities({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InfoBox(icon: Icons.wifi, text: 'Free Wifi'),
          SizedBox(width: 16),
          InfoBox(icon: Icons.local_dining, text: 'Free Breakfast'),
          SizedBox(width: 16),
          InfoBox(icon: Icons.star, text: '4.7', iconColor: Colors.yellow),
        ],
      ),
    );
  }
}

class HeroImage extends StatelessWidget {
  const HeroImage({
    super.key,
    required this.hotelImage,
  });

  final String hotelImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
          child: Image.asset(hotelImage),
        ),
        Positioned(
          top: 40,
          left: 10,
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Text(
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
    );
  }
}

class InfoBox extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const InfoBox({
    super.key,
    required this.icon,
    required this.text,
    this.iconColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5FF),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(fontFamily: 'Urbanist')),
        ],
      ),
    );
  }
}

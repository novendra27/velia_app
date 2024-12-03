import 'package:flutter/material.dart';
import 'package:velia_app/views/pages/room_detail_page.dart';
import 'dart:math';

class HotelListCard extends StatelessWidget {
  final String hotelName;
  final String hotelCity;
  final String hotelDescription;
  final int hotelIndexImage;

  const HotelListCard({
    super.key,
    required this.hotelName,
    required this.hotelCity,
    required this.hotelDescription,
    required this.hotelIndexImage,
  });

  @override
  Widget build(BuildContext context) {
    final int hotelPrice = randomizeDollar();
    final String hotelImage = generateImageLink(hotelIndexImage);
    final int discount = randomizeDiscount();

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RoomDetailPage(
              hotelName: hotelName,
              hotelCity: hotelCity,
              hotelDescription: hotelDescription,
              hotelPrice: hotelPrice,
              hotelImage: hotelImage,
            ),
          ),
        );
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(hotelImage),
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
                  "${hotelName.length > 14 ? '${hotelName.substring(0, 14)}...' : hotelName}\n\$$hotelPrice",
                  style: const TextStyle(
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
                  color: const Color.fromARGB(150, 0, 0, 0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '$discount% Off',
                  style: const TextStyle(
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

int randomizeDollar() {
  final random = Random();
  int min = 100;
  int max = 450;
  int result = (min + random.nextInt((max - min) ~/ 10 + 1) * 10);
  return result;
}

String generateImageLink(index) {
  List<String> options = [
    'detail_kamar',
    'hotel1',
    'hotel2',
    'hotel3',
    'hotel4',
    'hotel5',
    'hotel6',
    'hotel7',
    'hotel8',
    'hotel9',
    'hotel10',
    'hotel11',
    'hotel12',
    'hotel13',
    'hotel14',
    'hotel15',
    'hotel16',
    'hotel17',
    'hotel18',
    'hotel19',
    'hotel20',
  ];
  String name = options[index];
  String result = 'assets/images/$name.jpg';
  return result;
}

int randomizeDiscount() {
  final random = Random();
  int min = 20;
  int max = 70;
  int result = min + (random.nextInt((max - min) ~/ 5 + 1) * 5);
  return result;
}

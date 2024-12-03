import 'package:flutter/material.dart';
import 'package:velia_app/models/hotels_model.dart';
import 'package:velia_app/views/widgets/hotel_list_card.dart';

// ignore: must_be_immutable
class ListPage extends StatelessWidget {
  final List<Hotel> hotels;
  String headerText;
  int indexHotel;

  ListPage({
    super.key,
    required this.headerText,
    required this.hotels,
    required this.indexHotel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          headerText,
          style: const TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 0,
          mainAxisSpacing: 16,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return HotelListCard(
            hotelName: hotels[index + indexHotel].name,
            hotelCity: hotels[index + indexHotel].city,
            hotelDescription: hotels[index + indexHotel].hotelDescription,
            hotelIndexImage: index + indexHotel,
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:velia_app/views/pages/my_order_page.dart';
import 'package:velia_app/models/hotels_model.dart';
import 'package:velia_app/services/hotel_api_service.dart';
import 'package:velia_app/views/widgets/search_textfield.dart';
import 'package:velia_app/views/widgets/hotel_list_card.dart';

import 'list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HotelApiService _hotelApiService = HotelApiService();
  List<Hotel> hotels = [];

  @override
  void initState() {
    super.initState();
    _fetchHotels();
  }

  Future<void> _fetchHotels() async {
    final fetchedHotels = await _hotelApiService.getHotels();
    setState(() {
      hotels = fetchedHotels;
    });
  }

  @override
  Widget build(BuildContext context) {
    return hotels.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {},
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Header(),
                    const SizedBox(height: 10),
                    const BookingType(),
                    const SizedBox(height: 10),
                    const SearchTextfield(),
                    const SizedBox(height: 20),
                    SearchButton(hotels: hotels),
                    const SizedBox(height: 20),
                    HeaderCardText(hotels: hotels, headerText: 'Special offer', indexHotel: 0),
                    const SizedBox(height: 10),
                    HotelList(hotels: hotels, hotelIndex: 0),
                    const SizedBox(height: 20),
                    HeaderCardText(hotels: hotels, headerText: 'Popular Hotels', indexHotel: 10),
                    const SizedBox(height: 10),
                    HotelList(hotels: hotels, hotelIndex: 10),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: const BottomNavBar(),
          );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyOrderPage()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: const Text(
          'My Order',
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class HotelList extends StatelessWidget {
  List<Hotel> hotels;
  int hotelIndex;

  HotelList({
    super.key,
    required this.hotels,
    required this.hotelIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return HotelListCard(
            hotelName: hotels[index + hotelIndex].name,
            hotelCity: hotels[index + hotelIndex].city,
            hotelDescription: hotels[index + hotelIndex].hotelDescription,
            hotelIndexImage: index + hotelIndex,
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class HeaderCardText extends StatelessWidget {
  List<Hotel> hotels;
  String headerText;
  int indexHotel;

  HeaderCardText({
    super.key,
    required this.headerText,
    required this.hotels,
    required this.indexHotel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          headerText,
          style: const TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ListPage(headerText: headerText, hotels: hotels, indexHotel: indexHotel)),
            );
          },
          child: const Text(
            "View All",
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Let Explore the world!',
      style: TextStyle(
        fontFamily: 'Urbanist',
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
    );
  }
}

class BookingType extends StatelessWidget {
  const BookingType({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            // Flight booking
          },
          child: const Text(
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
            // Hotel booking
          },
          child: const Text(
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
    );
  }
}

// ignore: must_be_immutable
class SearchButton extends StatelessWidget {
  List<Hotel> hotels;

  SearchButton({super.key, required this.hotels});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ListPage(headerText: 'Search Result', hotels: hotels, indexHotel: 4, )),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          padding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 120.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: const Text(
          'Search Hotels',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Urbanist',
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

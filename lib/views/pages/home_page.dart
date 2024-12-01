import 'package:flutter/material.dart';
import 'package:velia_app/views/pages/my_order_page.dart';
import 'package:velia_app/models/hotels_model.dart';
import 'package:velia_app/services/hotel_api_service.dart';
import 'package:velia_app/views/widgets/search_textfield.dart';
import 'package:velia_app/views/widgets/special_offer_card.dart';

import 'search_page.dart';

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
                    const SearchButton(),
                    const SizedBox(height: 20),
                    const SpecialOfferText(),
                    const SizedBox(height: 10),
                    HotelList(hotels: hotels),
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

class HotelList extends StatelessWidget {
  const HotelList({
    super.key,
    required this.hotels,
  });

  final List<Hotel> hotels;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) {
          return SpecialOfferCard(
            hotelName: hotels[index].name,
            hotelCity: hotels[index].city,
            hotelDescription: hotels[index].hotelDescription,
            hotelIndexImage: index,
          );
        },
      ),
    );
  }
}

class SpecialOfferText extends StatelessWidget {
  const SpecialOfferText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Special offer',
      style: TextStyle(
        fontFamily: 'Urbanist',
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SearchPage()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(
              vertical: 15.0, horizontal: 120.0),
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

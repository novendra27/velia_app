import 'package:dio/dio.dart';
import 'package:velia_app/models/hotels_model.dart';

class HotelApiService {
  final Dio _dio = Dio();

  HotelApiService() {
    _dio.options.baseUrl = 'https://booking-com.p.rapidapi.com';
  }

  Future<List<Hotel>> getHotels() async {
    try {
      final response = await _dio.get('/v1/static/hotels',
          queryParameters: {'page': 0},
          options: Options(headers: {
            'x-rapidapi-key':
                '1ab65bfde9msh6abd88c292d0214p16a211jsne33b53e1b1ce',
            'x-rapidapi-host': 'booking-com.p.rapidapi.com',
          }));

      return (response.data['result'] as List)
          .map((hotel) => Hotel.fromJson(hotel))
          .toList();
    } catch (e) {
      // print('Error: $e');
      return [];
    }
  }
}

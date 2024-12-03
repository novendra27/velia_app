class Hotel {
  final String name;
  final int hotelId;
  final String city;
  final String address;
  final String hotelDescription;

  Hotel({
    required this.name,
    required this.hotelId,
    required this.city,
    required this.address,
    required this.hotelDescription,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      name: json['name'],
      hotelId: json['hotel_id'],
      city: json['city'],
      address: json['address'],
      hotelDescription: json['hotel_description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'hotel_id': hotelId,
      'city': city,
      'address': address,
      'hotel_description': hotelDescription,
    };
  }
}
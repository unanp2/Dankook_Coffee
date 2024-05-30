class Store {
  final int storeId;
  final String storePictureUrl;
  final String storeName;
  final String storeAddress;
  final String storePhoneNumber;
  final double latitude;
  final double longitude;
  final double ratingAverage;

  Store({
    required this.storeId,
    required this.storePictureUrl,
    required this.storeName,
    required this.storeAddress,
    required this.storePhoneNumber,
    required this.latitude,
    required this.longitude,
    required this.ratingAverage,
  });

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      storeId: json['store_id'],
      storePictureUrl: json['store_picture_url'],
      storeName: json['store_name'],
      storeAddress: json['store_address'],
      storePhoneNumber: json['store_phone_number'],
      latitude: json['latitude'].toDouble(),
      longitude: json['longitude'].toDouble(),
      ratingAverage: json['rating_average'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'store_id': storeId,
      'store_picture_url': storePictureUrl,
      'store_name': storeName,
      'store_address': storeAddress,
      'store_phone_number': storePhoneNumber,
      'latitude': latitude,
      'longitude': longitude,
      'rating_average': ratingAverage,
    };
  }
}

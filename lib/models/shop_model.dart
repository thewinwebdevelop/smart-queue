class ShopModel {
  final String id;
  final String name;
  final double lat;
  final double lng;
  final String checkinStart;
  final String checkinEnd;

  ShopModel({
    required this.id,
    required this.name,
    required this.lat,
    required this.lng,
    required this.checkinStart,
    required this.checkinEnd,
  });

  factory ShopModel.fromJson(Map<String, dynamic> json) {
    return ShopModel(
      id: json['id'],
      name: json['name'],
      lat: json['lat'] as double? ?? 0.0,
      lng: json['lng'] as double? ?? 0.0,
      checkinStart: json['checkin_start'] ?? 0,
      checkinEnd: json['checkin_end'] ?? 0,
    );
  }
}

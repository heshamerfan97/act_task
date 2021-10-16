class Geo {
  final double lat, lng;

  Geo({required this.lat, required this.lng});

  factory Geo.fromJson(Map<String, dynamic>? json) =>
      Geo(lat: double.tryParse(json?['lat']) ?? 0.0, lng: double.tryParse(json?['lng']) ?? 0.0);
}
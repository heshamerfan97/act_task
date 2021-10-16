import 'geo.dart';

class Address {
  final String street, suite, city, zip;
  final Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zip,
    required this.geo,
  });

  factory Address.fromJson(Map<String, dynamic>? json) => Address(
      street: json?['street'] ?? '',
      suite: json?['suite'] ?? '',
      city: json?['city'] ?? '',
      zip: json?['zip'] ?? '',
      geo: Geo.fromJson(json?['geo']));
}
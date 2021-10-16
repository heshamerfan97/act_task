import 'address.dart';
import 'company.dart';

class User {
  final int id;
  final String name, userName, email, phone, website;
  final Address address;
  final Company company;

  User({
    required this.id,
    required this.name,
    required this.userName,
    required this.email,
    required this.phone,
    required this.website,
    required this.address,
    required this.company,
  });

  factory User.fromJson(Map<String, dynamic>? json) => User(
        id: json?['id'] ?? -1,
        name: json?['name'] ?? 'name',
        userName: json?['username'] ?? 'username',
        email: json?['email'] ?? 'email',
        phone: json?['phone'] ?? 'phone',
        website: json?['website'] ?? 'website',
        address: Address.fromJson(json?['address']),
    company: Company.fromJson(json?['company']),
      );
}







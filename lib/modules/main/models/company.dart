class Company {
  final String name, catchPhrase, bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.fromJson(Map<String, dynamic>? json) => Company(
    name: json?['name'] ?? 'Company name',
    catchPhrase: json?['catchPhrase']?? 'catchPhrase',
    bs: json?['bs']?? '',
  );
}
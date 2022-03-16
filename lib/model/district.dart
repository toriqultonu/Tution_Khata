class District {
  final String id;
  final String district;

  District._({required this.id, required this.district});

  factory District.fromJson(Map<String, dynamic> json) {
    return new District._(
      id: json['id'],
      district: json['district'],
    );
  }
}
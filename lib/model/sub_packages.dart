
class SubPackages {
  final id;
  final packageName;
  final numberOfDays;
  final packageCharge;

  SubPackages({required this.id, required this.packageName, required this.numberOfDays, required this.packageCharge});

  static SubPackages fromJson(json) => SubPackages(
      id: json['id'],
      packageName: json['packageName'],
      numberOfDays: json['numberOfDays'],
      packageCharge: json['packageCharge']
  );
}
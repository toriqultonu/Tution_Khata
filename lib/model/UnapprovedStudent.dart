
class UnapprovedStudent{
  final id;
  final name;
  final phone;


  const UnapprovedStudent({required this.id, required this.name, required this.phone});

  static UnapprovedStudent fromJson(json) => UnapprovedStudent(
      id: json['id'],
      name: json['name'],
      phone: json['phone']
  );
}
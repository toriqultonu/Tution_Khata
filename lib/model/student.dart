
class Student{
  final id;
  final name;
  final phone;
  final approvalStatus;
  final isActive;



  const Student({required this.id, required this.name, required this.phone, required this.approvalStatus, required this.isActive});

  static Student fromJson(json) => Student(
     id: json['id'],
      name: json['name'],
      phone: json['phone'],
      approvalStatus: json['approvalStatus'],
      isActive: json['isActive']
  );
}
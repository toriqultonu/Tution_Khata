
class UnpaidStudent{

  final String id;
  final String name;
  final String phone;
  final String monthId;
  final String month;
  final String yearId;
  final String fee;
  final String paidAmount;
  final String waiverAmount;

  UnpaidStudent({required this.id, required this.name, required this.phone, required this.monthId, required this.month,
      required this.yearId, required this.fee, required this.paidAmount, required this.waiverAmount});

  factory UnpaidStudent.fromJson(Map<String, dynamic> json) => UnpaidStudent(id: json['id'], name: json['name'], phone: json['phone'], monthId: json['monthId'], month: json['month'], yearId: json['yearId'], fee: json['fee'], paidAmount: json['paidAmount'], waiverAmount: json['waiverAmount']);
}
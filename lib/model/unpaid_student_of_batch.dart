class UnpaidStudentsOfBatch {
  final id;
  final name;
  final phone;
  final monthId;
  final month;
  final yearId;
  final fee;
  final paidAmount;
  final waiverAmount;



  const UnpaidStudentsOfBatch({required this.id, required this.name, required this.phone, required this.monthId,required this.month,required this.yearId,required this.fee,required this.paidAmount,required this.waiverAmount});

  static UnpaidStudentsOfBatch fromJson(json) => UnpaidStudentsOfBatch(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      monthId: json['monthId'],
      month: json['month'],
      yearId: json['yearId'],
      fee: json['fee'],
      paidAmount: json['paidAmount'],
      waiverAmount: json['waiverAmount']
  );
}
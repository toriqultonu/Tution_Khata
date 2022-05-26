class UnPaidMonthOfStudent{
  final id;
  final monthId;
  final month;
  final yearId;
  final fee;
  final paidAmount;
  final waiverAmount;



  const UnPaidMonthOfStudent({required this.id, required this.monthId, required this.month, required this.yearId, required this.fee, required this.paidAmount, required this.waiverAmount});

  static UnPaidMonthOfStudent fromJson(json) => UnPaidMonthOfStudent(
      id: json['id'],
      monthId: json['monthId'],
      month: json['month'],
      yearId: json['yearId'],
      fee: json['fee'],
      paidAmount: json['paidAmount'],
      waiverAmount: json['waiverAmount']
  );
}
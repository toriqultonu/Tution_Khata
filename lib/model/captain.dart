
class Captain{
  final String batchId;
  final String captainName;
  final String phone;



  const Captain({required this.batchId, required this.captainName, required this.phone});

  static Captain fromJson(json) => Captain(
      batchId: json['username'],
      captainName: json['name'],
      phone: json['phone']
  );
}
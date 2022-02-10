
class Batch{
  final String batchId;
  final String batchName;
  final String students_count;

  Batch({required this.batchId, required this.batchName, required this.students_count});

  static Batch fromJson(json) => Batch(
    batchId: json['batchId'],
    batchName: json['batchName'],
    students_count: json['students_count']
  );
}
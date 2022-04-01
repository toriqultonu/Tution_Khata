
// class ModifiedSchedule{
//   String? schedule;
//   String? startingTime;
//   String? endingTime;
// }

class Batch{
  final String batchId;
  final String batchName;
  final String students_count;
  final String scheduleDays;
  final String startingTime;
  final String endingTime;


  Batch({required this.scheduleDays, required this.startingTime, required this.endingTime, required this.batchId, required this.batchName, required this.students_count});

  static Batch fromJson(json) => Batch(
    batchId: json['batchId'],
    batchName: json['batchName'],
    students_count: json['students_count'],
    scheduleDays: json['scheduleDays'],
    startingTime: json['startingTime'],
    endingTime: json['endingTime']
  );
}
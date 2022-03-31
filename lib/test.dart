

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'constant.dart';

class ModifiedSchedule {
  String? schedule;
  String? startingTime;
  String? endingTime;

  factory ModifiedSchedule.fromJson(Map<String, dynamic> json) {
    return new ModifiedSchedule._(
      schedule: json['schedule'],
      startingTime: json['startingTime'],
      endingTime: json['endingTime']
    );
  }

  ModifiedSchedule._({schedule, startingTime, endingTime});

}

class Batch {
  String? batchId;
  String? batchName;
  String? students_count;
  ModifiedSchedule? schedule;

  Batch(this.batchId, this.batchName, this.students_count, this.schedule);
  factory Batch.fromJson(dynamic json) {
    return Batch(json['batchId'] as String, json['batchName'] as String,json['students_count'] as String, ModifiedSchedule.fromJson(json['modifiedSchedule']));
  }
  // @override
  // String toString() {
  //   return '{ ${this.title}, ${this.description}, ${this.author.name} }';
  // }
}

void main() async{

  //Get batches information...
  //String token = await Candidate().getToken();
  // final response = await http.get(Uri.parse('https://tution.dcampusweb.com/api/batch/all/summary?token='), headers: {
  //   'Content-Type': 'application/json',
  //   'Accept': 'application/json',
  //   'Authorization': 'Bearer $token',
  // });
  // //print('Token : ${token}');
  // var jsonData = json.decode(response.body);
  // print(jsonData.length);
  // for(var data in jsonData){
  //   print(data['batchId']);
  // }
 // print(jsonData[0]['batchId']);


  //Create Attendance.
  // final msg = jsonEncode({
  //   "batchId":"1000001",
  //   "date":"12/18/1995",
  //   "absentStudents":[]
  // });
  // final response = await http.post(Uri.parse(
  //     'https://tution.dcampusweb.com/api/batch/attendance/create/bydate?token='),
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer $token',
  //     },
  //     body: msg);
  // final jsonData = json.decode(response.body);
  // print(response.statusCode);
  // print(jsonData);

  // Get all district
  // final response = await http.get(Uri.parse('https://tution.dcampusweb.com/api/districts'));
  // final jsonData = json.decode(response.body);
  // print(jsonData);

  // Registration
  // final msg = jsonEncode({
  //   "phone": tonu,
  //   "email":"demo@dmo.com",
  //   "name":"demo",
  //   "institutionName":"Demo Institution",
  //   "picPath":"",
  //   "districtId":"1",
  //   "upazilaId":"1",
  //   "genderId":"2",
  //   "password":"123456"
  // });
  // final response = await http.post(Uri.parse(
  //     'https://tution.dcampusweb.com/api/auth/registration'),
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Accept': 'application/json',
  //     },
  //     body: msg);
  // final jsonData = json.decode(response.body);
  // print(response.statusCode);
  // print(jsonData);
  // log('$jsonData');
  //Get upazilla by district id:


  // final response = await http.get(Uri.parse('https://tution.dcampusweb.com/api/upazilas-by-district?districtId=$upazillaid'));
  // //print('Token : ${token}');
  // var jsonData = json.decode(response.body);
  // print(jsonData.length);
  // print(jsonData);


  // Batch tutorial = Batch.fromJson(jsonDecode(nestedObjText));
  // log('$tutorial');
}


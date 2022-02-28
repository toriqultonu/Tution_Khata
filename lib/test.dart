

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'constant.dart';

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
  final msg = jsonEncode({
    "batchId":"1000001",
    "date":"12/18/1995",
    "absentStudents":[]
  });
  final response = await http.post(Uri.parse(
      'https://tution.dcampusweb.com/api/batch/attendance/create/bydate?token='),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: msg);
  final jsonData = json.decode(response.body);
  print(response.statusCode);
  print(jsonData);

}


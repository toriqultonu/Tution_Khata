import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tution_khata/constant.dart';
import 'package:http/http.dart' as http;

void main() async{

  final studentId = '2';

  final body = jsonEncode({
    "name":"Student One",
    "phone":"01940506870",
    "guardianName":"Student One Guardian",
    "guardianPhone":"01940000000",
    "dob":"12/16/1995"
  });

  final response = await http.post(Uri.parse(
      'https://tution.dcampusweb.com/api/student/change/basicinfo/$studentId?token='),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: body);
  final jsonData = json.decode(response.body);
  log('$jsonData');
}


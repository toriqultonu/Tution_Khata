import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tution_khata/constant.dart';
import 'package:http/http.dart' as http;

import 'Test/unpaid_student.dart';

void main() async{


  final response = await http.get(Uri.parse(
      'https://tution.dcampusweb.com/api/payment/unpaidmonth/bybatch/1000001?token='),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
  );
  final jsonData = json.decode(response.body);
  log("$jsonData");
  }
  //log('$jsonData');





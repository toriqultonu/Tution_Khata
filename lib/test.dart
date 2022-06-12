import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tution_khata/constant.dart';
import 'package:http/http.dart' as http;

import 'Test/unpaid_student.dart';

void main() async {
  final msg = jsonEncode({
    "phone": "01795107507",
    "email": "m@l.com",
    "name": "name",
    "institutionName": "e",
    "picPath": "",
    "districtId": "3",
    "upazilaId": "19",
    "genderId": "1",
    "password": "nxdwer"
  });
  final response1 = await http.post(Uri.parse(
      'https://tution.dcampusweb.com/api/auth/registration'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: msg);
  if (response1.statusCode == 200) {
    log("${jsonDecode(response1.body)}");

    final msg = jsonEncode({
      "phone": "01872856877"
    });
    final response = await http.post(Uri.parse(
        'https://tution.dcampusweb.com/api/otp/resend'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: msg);

    log('true');
  }
}
  //log('$jsonData');





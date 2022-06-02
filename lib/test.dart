import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tution_khata/constant.dart';
import 'package:http/http.dart' as http;

import 'Test/unpaid_student.dart';

void main() async{


  final msg = jsonEncode({
    "phone": "01795107577",
    "email": "m@g.com",
    "name": "name",
    "institutionName":"e",
    "picPath": "",
    "districtId": "3",
    "upazilaId": "19",
    "genderId": "1",
    "password":"nxdwer"
  });
  final response = await http.post(Uri.parse(
      'https://tution.dcampusweb.com/api/auth/registration'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: msg);
  if(response.statusCode == 200){

    final msg = jsonEncode({
      "phone": "01934897000"
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
  else {


    log('false ${jsonDecode(response.body)}');
  }
  }
  //log('$jsonData');





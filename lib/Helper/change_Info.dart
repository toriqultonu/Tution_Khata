import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../components/text_dialog_widget.dart';
import 'package:http/http.dart' as http;

import '../constant.dart';

Future<T?> showTextDialog<T>(

    BuildContext context, {
      required String title,
      required String value,
    }) => showDialog<T>(
  context: context,
  builder: (context) => TextDialogWidget(
    title: title,
    value: value,
  ),
);

  updateStudentInfo(String studentId, String studentName, String studentPhone) async {


  final body = jsonEncode({
    "name":studentName,
    "phone":studentPhone,
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

  return response.statusCode;

}

  updateCaptainInfo(String batchId, String captainName, String captainPhone) async {


  final body = jsonEncode({
    "batchId": batchId,
    "name":captainName,
    "phone":captainPhone,
  });

  final response = await http.post(Uri.parse(
      'https://tution.dcampusweb.com/api/batchcaptain/update/info?token='),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: body);
  final jsonData = json.decode(response.body);
  log('$jsonData');

  return response.statusCode;

}



import 'dart:convert';
import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:http/http.dart' as http;

import 'constant.dart';

void main() async {

  Map data = {
    "username": "01940506871",
    "password": "123456"
  };
  var jsonData1;
  //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var response1 = await http.post(Uri.parse('https://tution.dcampusweb.com/api/auth/login'), body: data);
  if(response1.statusCode == 200) {
    //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    jsonData1 = json.decode(response1.body);

    if (jsonData1["roles"].toString() == "[teacher]") {
      //setToken(jsonData1["access_token"]);
      //sharedPreferences.setString("token", jsonData["access_token"]);
      token = jsonData1["access_token"];

    }
  }
  final response = await http.get(Uri.parse(
      'https://tution.dcampusweb.com/api/teacher/info?token='),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${jsonData1["access_token"]}',
      });
  final jsonData = json.decode(response.body);

  log('${jsonData["name"]}');
}



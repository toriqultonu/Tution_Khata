import 'dart:convert';


import 'package:flutter/foundation.dart';

import 'package:flutter/services.dart';
import 'package:tution_khata/Test/unpaid_student.dart';
import 'package:http/http.dart' as http;

import '../constant.dart';

class UnpaidStudentProvider with ChangeNotifier {
  UnpaidStudentProvider() {
    loadCountries().then((countries) {
      _students = countries;
      notifyListeners();
    });
  }

  List<UnpaidStudent> _students = [];

  List<UnpaidStudent> get students => _students;

  Future loadCountries() async {
    final data = await http.get(Uri.parse(
        'https://tution.dcampusweb.com/api/payment/unpaidStudents/1000001?year=2021&monthId=2&token=$token'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    final jsonData= json.decode(data.body);

    return jsonData.map<UnpaidStudent>(UnpaidStudent.fromJson).toList();
  }
}



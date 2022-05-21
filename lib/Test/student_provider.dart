import 'dart:convert';


import 'package:flutter/foundation.dart';

import 'package:flutter/services.dart';
import 'package:tution_khata/Test/unpaid_student.dart';


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
    final data = await rootBundle.loadString('assets/country_codes.json');
    final countriesJson = json.decode(data);

    return countriesJson.keys.map<UnpaidStudent>((code) {
      final json = countriesJson[code];
      final newJson = json..addAll({'code': code.toLowerCase()});

      return UnpaidStudent.fromJson(newJson);
    }).toList()
      ..sort(Utils.ascendingSort);
  }
}


class Utils {
  static int ascendingSort(UnpaidStudent c1, UnpaidStudent c2) =>
      c1.name.compareTo(c2.name);
}
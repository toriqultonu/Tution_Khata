import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tution_khata/model/sub_packages.dart';

import '../model/district.dart';

class OpenAPIs{

  static Future<List<String>> getDistricts() async {
    final response = await http.get(Uri.parse('https://tution.dcampusweb.com/api/districts'));
    final jsonData = json.decode(response.body);
    print(jsonData);

    List<String> district = (json.decode(response.body)['district'] as List)
        .map((data) => District.fromJson(data)).cast<String>()
        .toList();

    return district;
  }

  static Future<List<SubPackages>> getPackages() async {

    final response = await http.get(Uri.parse('https://tution.dcampusweb.com/api/subscription-packages'));
    final jsonData = json.decode(response.body);

    return jsonData.map<SubPackages>(SubPackages.fromJson).toList();
  }
}
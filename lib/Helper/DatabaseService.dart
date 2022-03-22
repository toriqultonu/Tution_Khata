import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tution_khata/model/batch.dart';
import 'package:tution_khata/model/district.dart';

class DatabaseService{

  static Future<List<Batch>> getBatchList(var token) async {
    List<Batch> dataList = [];
    final response = await http.get(Uri.parse(
        'https://tution.dcampusweb.com/api/batch/all/summary?token='),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    final jsonData = json.decode(response.body);

    return jsonData.map<Batch>(Batch.fromJson).toList();
  }

  static Future<List<String>> getDistricts() async {
    final response = await http.get(Uri.parse('https://tution.dcampusweb.com/api/districts'));
    final jsonData = json.decode(response.body);
    print(jsonData);

    List<String> district = (json.decode(response.body)['district'] as List)
        .map((data) => District.fromJson(data)).cast<String>()
        .toList();

    return district;
  }


}
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tution_khata/model/batch.dart';

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

}
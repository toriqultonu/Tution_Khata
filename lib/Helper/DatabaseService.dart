import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:tution_khata/Test/unpaid_student.dart';
import 'package:tution_khata/model/student.dart';
import 'package:tution_khata/model/unapprovedstudent.dart';
import 'package:tution_khata/model/batch.dart';
import 'package:tution_khata/model/captain.dart';
import 'package:tution_khata/model/district.dart';
import 'package:tution_khata/model/unpaid_student_of_batch.dart';
import 'package:tution_khata/model/unpaidmonth_of_student.dart';

import '../constant.dart';
import '../model/unpaidmonths.dart';

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


  static getRegistered(String phone, String email, String name, String picPath, String districtId, String upazilaId, String genderId, String password) async{

    final msg = jsonEncode({
      "phone": phone,
      "email": email,
      "name": name,
      "institutionName":"",
      "picPath": "",
      "districtId": districtId,
      "upazilaId": upazilaId,
      "genderId": genderId,
      "password":password
    });
    final response = await http.post(Uri.parse(
        'https://tution.dcampusweb.com/api/auth/registration'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: msg);

      //return response;

  }

  static Future<List<Student>> getStudentList(var token) async{
    final response = await http.get(Uri.parse(
        'https://tution.dcampusweb.com/api/batch/get/students/bybatch/id/$batchId?token='),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    final jsonData = json.decode(response.body);

    return jsonData.map<Student>(Student.fromJson).toList();
  }

  static Future<List<Captain>> getCaptainList(var token) async {
    final response = await http.post(Uri.parse(
        'https://tution.dcampusweb.com/api/batchcaptain/get/all?token='),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    final jsonData = json.decode(response.body);

    return jsonData.map<Captain>(Captain.fromJson).toList();
  }

  static Future<List<UnapprovedStudent>> getUnapprovedStudentList(var token) async {

    final body = jsonEncode({
      "batchId": batchId
    });

    final response = await http.post(Uri.parse(
        'https://tution.dcampusweb.com/api/student/get/unapproved?token='),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: body);
    final jsonData = json.decode(response.body);

    return jsonData.map<UnapprovedStudent>(UnapprovedStudent.fromJson).toList();
  }

  static updateStudentInfo(var token,String name, String phone, String guardianName, String guardianPhone, String dob, String studentId) async{

    final body = jsonEncode({
      "name":name,
      "phone":phone,
      "guardianName":guardianName,
      "guardianPhone":guardianPhone,
      "dob":dob
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
  }

  static unPaidMonthByStudent(var token, var studentId) async{

    final response = await http.get(Uri.parse(
        'https://tution.dcampusweb.com/api/payment/unpaidmonth/bystudent/$studentId?token='),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    final jsonData = json.decode(response.body);

    return jsonData.map<UnPaidMonthOfStudent>(UnPaidMonthOfStudent.fromJson).toList();

  }

  static unPaidStudentByBatch(var token, String year, String monthId) async{

    final response = await http.get(Uri.parse(
        'https://tution.dcampusweb.com/api/payment/unpaidStudents/1000001?year=$year&monthId=$monthId&token='),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    final jsonData = json.decode(response.body);

    return jsonData.map<UnpaidStudent>(UnpaidStudent.fromJson).toList();
  }

  static Future<List<UnpaidMonths>> getUnpaidMonth(var token, String batchId) async{
    final response = await http.get(Uri.parse(
        'https://tution.dcampusweb.com/api/payment/unpaidmonth/bybatch/$batchId?token='),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    final jsonData = json.decode(response.body);

    return jsonData.map<UnpaidMonths>(UnpaidMonths.fromJson).toList();
  }

  static Future<List<UnpaidStudentsOfBatch>> getUnpaidStudentsOfBatch(var token, String batchId, String year, String monthId) async{
    final response = await http.get(Uri.parse(
        'https://tution.dcampusweb.com/api/payment/unpaidStudents/$batchId?year=$year&monthId=$monthId&token='),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    final jsonData = json.decode(response.body);

    return jsonData.map<UnpaidStudentsOfBatch>(UnpaidStudentsOfBatch.fromJson).toList();
  }

}
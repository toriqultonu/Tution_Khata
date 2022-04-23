import 'package:flutter/material.dart';
import 'package:tution_khata/components/custom_app_bar.dart';
import 'package:tution_khata/components/buttons/rounded_button.dart';
import 'package:tution_khata/views/unpaid_mon_list.dart';
import '../Helper/DatabaseService.dart';
import '../constant.dart';
import 'attendance_list.dart';

class StudentWiseCollection2 extends StatefulWidget {

  static String id = "student_wise_collection_2";

  const StudentWiseCollection2({Key? key}) : super(key: key);

  @override
  _StudentWiseCollection2State createState() => _StudentWiseCollection2State();
}

class _StudentWiseCollection2State extends State<StudentWiseCollection2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: CustomAppBar(str1: 'Student wise Collection' ),
        centerTitle: true,
        elevation: 15,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [

              SizedBox(height: 20,),
              Expanded(
                child: ListView(
                  children: [
                    FutureBuilder(
                        future: DatabaseService.unPaidMonthByStudent(token, 1),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return Center(
                                  child: Container(
                                    margin: EdgeInsets.only(top: 120),
                                    width: 150,
                                    height: 150,
                                    child: CircularProgressIndicator(),
                                  ));
                            default:
                              if (snapshot.hasError) {
                                return Center(
                                    child: Container(
                                      child: Text(
                                          'Some error occurred! Contact our support team'),
                                    ));
                              } else {
                                return UnpaidMonthList(snapshot: snapshot,);
                              }
                          }
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tution_khata/Helper/DatabaseService.dart';
import 'package:tution_khata/views/attendance_list.dart';
import 'package:tution_khata/build_lists/build_unapprovedStudent_list.dart';
import 'package:tution_khata/components/custom_app_bar.dart';
import 'package:tution_khata/components/buttons/rounded_button.dart';
import 'package:intl/intl.dart';

import '../constant.dart';
import '../model/attendance.dart';


class TakeAttendance extends StatefulWidget {
  const TakeAttendance({Key? key}) : super(key: key);

  @override
  _TakeAttendanceState createState() => _TakeAttendanceState();
}

class _TakeAttendanceState extends State<TakeAttendance> {

  String? currentDate;

  @override
  void initState() {
    var now = new DateTime.now();
    var formatter = new DateFormat.yMMMMd('en_US');
    currentDate = formatter.format(now);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: primaryColor,
          title: CustomAppBar(str1: 'Take Attendance'),
          centerTitle: true,
          elevation: 15,
        ),

        body: Center(
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 11),
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  decoration: CustomBoxDecoration(Colors.white),
                  child: Column(
                    children: [
                      Text('Date: $currentDate', style: TextStyle(color: primaryColor, fontWeight: FontWeight.w500, fontSize: 16),),
                      Spacer(),
                      Text('Batch Name: $batchName', style: TextStyle(color: primaryColor, fontWeight: FontWeight.w400, fontSize: 16),),

                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Expanded(
                  child: ListView(
                    children: [
                      FutureBuilder(
                          future: DatabaseService.getStudentList(token),
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
                                  return AttendanceList(snapshot: snapshot,);
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

      ),
    );
  }


}



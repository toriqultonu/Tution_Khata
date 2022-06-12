import 'package:flutter/material.dart';
import 'package:tution_khata/components/home_page_app_bar.dart';
import 'package:tution_khata/components/navigation_drawer.dart';
import 'package:tution_khata/views/add_student_by_teacher.dart';
import 'package:tution_khata/views/batch_details.dart';
import 'package:tution_khata/views/month_wise_collection.dart';
import 'package:tution_khata/views/send_sms.dart';
import 'package:tution_khata/views/take_attendance.dart';
import 'package:tution_khata/views/waiting_list.dart';

import '../constant.dart';
import 'fee_collection.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {

  static String id = "main_page";

  final String batchName;
  final String date;
  final String time;
  final String batchId;

  const MainPage({Key? key, required this.batchName, required this.date, required this.time, required this.batchId}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


  int pageIndex = 0;
  final screens = [
    BatchDetails(),
    TakeAttendance(),
    MonthWiseCollection(),
    SendSMS(),
    AddStudentByTeacher(),
  ];

  @override
  void initState() {
    batchName = widget.batchName;
    batchId = widget.batchId;
    date = widget.date;
    time = widget.time;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (index) => setState(() => pageIndex = index),
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels:false,
        items: [
          BottomNavigationBarItem(label: 'Home',icon: Icon(Icons.home),),
          BottomNavigationBarItem(label: 'Attendance',icon: Icon(Icons.task),),
          BottomNavigationBarItem(label: 'Fee Collection',icon: Icon(Icons.attach_money_rounded),),
          BottomNavigationBarItem(label: 'SMS',icon: Icon(Icons.sms),),
          BottomNavigationBarItem(label: 'Add Student',icon: Icon(Icons.add_circle_rounded),),
        ],
      ),
    );
  }
}

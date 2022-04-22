import 'package:flutter/material.dart';
import 'package:tution_khata/components/home_page_app_bar.dart';
import 'package:tution_khata/components/navigation_drawer.dart';
import 'package:tution_khata/views/add_student_by_teacher.dart';
import 'package:tution_khata/views/batch_details.dart';
import 'package:tution_khata/views/send_sms.dart';
import 'package:tution_khata/views/take_attendance.dart';
import 'package:tution_khata/views/waiting_list.dart';

import '../constant.dart';
import 'fee_collection.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {

  static String id = "main_page";

  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int pageIndex = 0;
  final screens = [
    BatchDetails(),
    TakeAttendance(),
    FeeCollection(),
    SendSMS(),
    AddStudentByTeacher(),
  ];

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
          BottomNavigationBarItem(label: 'Attendance',icon: Icon(Icons.whatshot),),
          BottomNavigationBarItem(label: 'Fee Collection',icon: Icon(Icons.notifications_active),),
          BottomNavigationBarItem(label: 'SMS',icon: Icon(Icons.search),),
          BottomNavigationBarItem(label: 'Add Student',icon: Icon(Icons.account_circle),),
        ],
      ),
    );
  }
}

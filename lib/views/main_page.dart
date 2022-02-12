import 'package:flutter/material.dart';
import 'package:tution_khata/components/home_page_app_bar.dart';
import 'package:tution_khata/components/navigation_drawer.dart';
import 'package:tution_khata/views/take_attendance.dart';

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
    HomeScreen(),
    TakeAttendance(),
    FeeCollection(),
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
          BottomNavigationBarItem(label: 'Waiting List',icon: Icon(Icons.account_circle),),
        ],
      ),
    );
  }
}

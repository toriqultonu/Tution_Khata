import 'package:flutter/material.dart';
import 'package:tution_khata/components/appBar.dart';
import 'package:tution_khata/components/navigation_drawer.dart';
import 'package:tution_khata/constant.dart';

import '../main.dart';

class HomeScreen extends StatefulWidget {

  static String id = "home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        title: CustomAppBar(str1: 'ডেটা ',str2:'স্ট্যাকচার'),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          Opacity(
            opacity: 0.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
      body: Container(
        //color: primaryColor,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [


                ],
              ),
            ),

            //BannerAdsWidgets(),

          ],
        ),
      ),
    );
  }
}
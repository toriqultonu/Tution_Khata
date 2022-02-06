import 'package:flutter/material.dart';
import 'package:tution_khata/components/custom_app_bar.dart';
import 'package:tution_khata/components/home_page_app_bar.dart';
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
        toolbarHeight: 90,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        title: HomeAppBar(),
        //centerTitle: true,

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
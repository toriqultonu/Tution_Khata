import 'dart:convert';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tution_khata/Helper/DatabaseService.dart';
import 'package:tution_khata/cards/batch_card.dart';
import 'package:tution_khata/components/home_page_app_bar.dart';
import 'package:tution_khata/build_lists/build_batch_list.dart';
import 'package:tution_khata/components/navigation_drawer.dart';
import 'package:tution_khata/constant.dart';
import 'package:http/http.dart' as http;
import 'package:tution_khata/model/batch.dart';
import 'package:tution_khata/views/take_attendance.dart';

import '../main.dart';
import 'fee_collection.dart';

class HomeScreen extends StatefulWidget {
  static String id = "home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

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
        elevation: 15,
      ),
      body: Container(
        //color: primaryColor,
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 112,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.easeInOut,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 8.0,
                //disableCenter: false,
              ),
              items: [
                Container(
                  width: 298,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/component/demoadbanner.png'),
                        fit: BoxFit.cover,
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Advertise',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 45,
            ),
            Expanded(
              child: ListView(
                children: [
                  FutureBuilder(
                      future: DatabaseService.getBatchList(token),
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
                              return buildBatch(snapshot);
                            }
                        }
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

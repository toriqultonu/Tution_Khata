import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tution_khata/Helper/DatabaseService.dart';
import 'package:tution_khata/cards/batch_card.dart';
import 'package:tution_khata/components/home_page_app_bar.dart';
import 'package:tution_khata/build_lists/build_batch_list.dart';
import 'package:tution_khata/components/navigation_drawer.dart';
import 'package:tution_khata/constant.dart';
import 'package:http/http.dart' as http;
import 'package:tution_khata/model/batch.dart';
import 'package:tution_khata/views/create_batch.dart';
import 'package:tution_khata/views/take_attendance.dart';
import 'package:tution_khata/views/version_details.dart';


import '../components/add_student_alert_dialog.dart';
import '../main.dart';
import 'fee_collection.dart';

class HomeScreen extends StatefulWidget {
  static String id = "home_screen";


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  void initState(){
    //token = getToken();
    log('$token');

    setState(() {

    });
    super.initState();
  }

  Future openDialog(context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: AddStudentAlert()
      ),
    );
  }

  Future refresh() async{
    setState(() {
      DatabaseService.getBatchList(token);
    });
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
              height: 25,
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, VersionDetails.id);
              },
                child: Text('Buy package')),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: refresh,
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
                                child: LoadingAnimationWidget.dotsTriangle(
                                  color: primaryColor,
                                  size: 100,
                                ),
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
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(backgroundColor: primaryColor,onPressed: () { Navigator.pushNamed(context, CreateBatch.id); }, child: Icon(Icons.add),),

    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tution_khata/components/batch_card.dart';
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
        elevation: 15,

      ),
      body: Container(
        //color: primaryColor,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  SizedBox(height: 24,),
                  CarouselSlider(
                      options: CarouselOptions(
                        height: 112,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16/9,
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
                              image: AssetImage('assets/component/demoadbanner.png'),
                              fit: BoxFit.cover,
                            )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Advertise', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w700),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  SizedBox(height: 45,),
                  ListView.builder(
                      physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return BatchCard(batchName: 'Math01',
                          date: 'sat-sun-mon',
                          batchId: '3243',
                          time: '4.00-5.00');
                    }
                  )

                ],
              ),
            ),

            //BannerAdsWidgets(),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: (){

        },
      ),
    );
  }
}






import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tution_khata/Helper/DatabaseService.dart';
import 'package:tution_khata/build_lists/build_unapprovedStudent_list.dart';
import 'package:tution_khata/components/custom_app_bar.dart';
import 'package:tution_khata/components/rounded_button.dart';
import 'package:tution_khata/views/month_wise_collection.dart';
import 'package:tution_khata/views/student_wise_collection.dart';

import '../constant.dart';


class FeeCollection extends StatefulWidget {

  static String id = "fee_collection";

  const FeeCollection({Key? key}) : super(key: key);

  @override
  _FeeCollectionState createState() => _FeeCollectionState();
}

class _FeeCollectionState extends State<FeeCollection> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: CustomAppBar(str1: 'Fee Collection' ),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Select an option below', style: TextStyle(color: primaryColor, fontWeight: FontWeight.w500, fontSize: 20),),
                    ],
                  ),
                ),
                SizedBox(height: 40,),

                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, StudentWiseCollection.id);
                  },
                  child: Container(
                    height: 108,
                    width: MediaQuery.of(context).size.width* 0.9,
                    decoration: CustomBoxDecoration(primaryColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 25,),
                        Text('Student wise Collection', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),),
                        Spacer(),
                        Text('একাধিক শিক্ষার্থী একই মাসের ফি নিন', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w400),),
                        SizedBox(height: 25,)
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 40,),

                GestureDetector(
                  onTap: (){
                  Navigator.pushNamed(context, MonthWiseCollection.id);
                },
                  child: Container(
                    height: 108,
                    width: MediaQuery.of(context).size.width* 0.9,
                    decoration: CustomBoxDecoration(primaryColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 25,),
                        Text('Month wise Collection', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),),
                        Spacer(),
                        Text('একজন শিক্ষার্থী একাধিক মাসের ফি নিন', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w400),),
                        SizedBox(height: 25,)
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 40,),

                Container(
                  height: 108,
                  width: MediaQuery.of(context).size.width* 0.9,
                  decoration: CustomBoxDecoration(primaryColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 25,),
                      Text('Partial Collection', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),),
                      Spacer(),
                      Text('আংশিক গ্রহণ / ছাড় প্রদান ', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w400),),
                      SizedBox(height: 25,)
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

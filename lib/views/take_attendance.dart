import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tution_khata/components/custom_app_bar.dart';

import '../constant.dart';

void main(){
  return runApp(TakeAttendance());
}

class TakeAttendance extends StatefulWidget {
  const TakeAttendance({Key? key}) : super(key: key);

  @override
  _TakeAttendanceState createState() => _TakeAttendanceState();
}

class _TakeAttendanceState extends State<TakeAttendance> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: primaryColor,
          title: CustomAppBar(str1: 'Take Attendance', str2: '',),
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
                  //width: MediaQuery.of(context).size.width,
                  decoration: CustomBoxDecoration(Colors.white),
                  child: Column(
                    children: [
                      Text('Date: 22nd May 2021', style: TextStyle(color: primaryColor, fontWeight: FontWeight.w500, fontSize: 16),),
                      Spacer(),
                      Text('Batch Name: Math01', style: TextStyle(color: primaryColor, fontWeight: FontWeight.w400, fontSize: 16),),

                    ],
                  ),
                ),
                SizedBox(height: 20,),

              ],
            ),
          ),
        ),

      ),
    );
  }
}

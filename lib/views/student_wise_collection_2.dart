import 'package:flutter/material.dart';
import 'package:tution_khata/components/custom_app_bar.dart';
import 'package:tution_khata/components/buttons/rounded_button.dart';
import '../constant.dart';

class StudentWiseCollection2 extends StatefulWidget {

  static String id = "student_wise_collection_2";

  const StudentWiseCollection2({Key? key}) : super(key: key);

  @override
  _StudentWiseCollection2State createState() => _StudentWiseCollection2State();
}

class _StudentWiseCollection2State extends State<StudentWiseCollection2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: CustomAppBar(str1: 'Student wise Collection' ),
        centerTitle: true,
        elevation: 15,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 11, horizontal: 52),
                height: 55,
                width: MediaQuery.of(context).size.width,
                //decoration: CustomBoxDecoration(Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('TOTAL:', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),),
                    Spacer(),
                    Text('0 BDT', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),),
                  ],
                ),
              ),


              RoundedButton(color: primaryColor, title: 'Go Home', onPressed: (){print('go home');}, height: 45, width: 277)
            ],
          ),
        ),
      ),

    );
  }
}

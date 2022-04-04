import 'package:flutter/material.dart';

import '../components/custom_app_bar.dart';
import '../constant.dart';

class AddStudent extends StatefulWidget {
  static String id = "add_student";

  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        title: CustomAppBar(str1: 'Captain Panel'),
        centerTitle: true,
        elevation: 15,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.8,
                padding: EdgeInsets.all(20),
                decoration: CustomBoxDecoration(secondaryColor),
                child: Column(
                  children: [

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

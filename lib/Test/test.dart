import 'package:flutter/material.dart';
import 'package:tution_khata/Test/unpaid_student_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      //initialRoute: LoginScreen.id,



      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: UnpaidStudentPage(isMultiSelection: true,),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tution_khata/constant.dart';
import 'package:tution_khata/views/about_us.dart';
import 'package:tution_khata/views/add_student_by_captain.dart';
import 'package:tution_khata/views/add_student_by_teacher.dart';
import 'package:tution_khata/views/batch_details.dart';
import 'package:tution_khata/views/batch_update.dart';
import 'package:tution_khata/views/captain_panel_view.dart';
import 'package:tution_khata/views/contact_us.dart';
import 'package:tution_khata/views/edit_captain_view.dart';
import 'package:tution_khata/views/edit_student_view.dart';
import 'package:tution_khata/views/fee_collection.dart';
import 'package:tution_khata/views/home_page.dart';
import 'package:tution_khata/views/login_page.dart';
import 'package:tution_khata/views/main_page.dart';
import 'package:tution_khata/views/month_wise_collection.dart';
import 'package:tution_khata/views/personal_sms_view.dart';
import 'package:tution_khata/views/phone_verification_page.dart';
import 'package:tution_khata/views/profile_page.dart';
import 'package:tution_khata/views/register_page.dart';
import 'package:tution_khata/views/send_sms.dart';
import 'package:tution_khata/views/sms_purchase.dart';
import 'package:tution_khata/views/student_wise_collection.dart';
import 'package:tution_khata/views/student_wise_collection_2.dart';
import 'package:tution_khata/views/version_details.dart';
import 'package:tution_khata/views/waiting_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: primaryColor,
          secondary: secondaryColor
        ),
        fontFamily: 'Raleway',
      ),

      //initialRoute: LoginScreen.id,

      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        PhoneVerification.id: (context) => PhoneVerification(),
        HomeScreen.id: (context) => HomeScreen(),
        BatchDetails.id: (context) => BatchDetails(),
        //MainPage.id: (context) => MainPage(),
        FeeCollection.id: (context) => FeeCollection(),
        SendSMS.id: (context) => SendSMS(),
        ProfilePage.id: (context) => ProfilePage(),
        StudentWiseCollection.id: (context) => StudentWiseCollection(),
        StudentWiseCollection2.id: (context) => StudentWiseCollection2(),
        MonthWiseCollection.id: (context) => MonthWiseCollection(),
        WaitingList.id: (context) => WaitingList(),
        AboutUs.id: (context) => AboutUs(),
        ContactUs.id: (context) => ContactUs(),
        EditStudent.id: (context) => EditStudent(),
        CaptainPanel.id: (context) => CaptainPanel(),
        AddStudent.id: (context) => AddStudent(),
        PersonalSMS.id: (context) => PersonalSMS(),
        SMSPurchase.id: (context) => SMSPurchase(),
        EditCaptain.id: (context) => EditCaptain(),
        AddStudentByTeacher.id: (context) => AddStudentByTeacher(),
        BatchUpdate.id: (context) => BatchUpdate(),
        VersionDetails.id: (context) => VersionDetails(),

      },

      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: LoginScreen(),
      ),
    );
  }
}




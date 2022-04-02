import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tution_khata/constant.dart';
import 'package:tution_khata/views/about_us.dart';
import 'package:tution_khata/views/batch_details.dart';
import 'package:tution_khata/views/captain_panel_view.dart';
import 'package:tution_khata/views/contact_us.dart';
import 'package:tution_khata/views/edit_student_view.dart';
import 'package:tution_khata/views/fee_collection.dart';
import 'package:tution_khata/views/home_page.dart';
import 'package:tution_khata/views/login_page.dart';
import 'package:tution_khata/views/main_page.dart';
import 'package:tution_khata/views/month_wise_collection.dart';
import 'package:tution_khata/views/phone_verification_page.dart';
import 'package:tution_khata/views/profile_page.dart';
import 'package:tution_khata/views/register_page.dart';
import 'package:tution_khata/views/send_sms.dart';
import 'package:tution_khata/views/student_wise_collection.dart';
import 'package:tution_khata/views/waiting_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        MainPage.id: (context) => MainPage(),
        FeeCollection.id: (context) => FeeCollection(),
        SendSMS.id: (context) => SendSMS(),
        ProfilePage.id: (context) => ProfilePage(),
        StudentWiseCollection.id: (context) => StudentWiseCollection(),
        MonthWiseCollection.id: (context) => MonthWiseCollection(),
        WaitingList.id: (context) => WaitingList(),
        AboutUs.id: (context) => AboutUs(),
        ContactUs.id: (context) => ContactUs(),
        EditStudent.id: (context) => EditStudent(),
        CaptainPanel.id: (context) => CaptainPanel(),

      },

      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: LoginScreen(),
      ),
    );
  }
}




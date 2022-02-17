import 'package:flutter/material.dart';
import 'package:tution_khata/Helper/DatabaseService.dart';
import 'package:tution_khata/components/add_student_alert_dialog.dart';
import 'package:tution_khata/components/build_student_list.dart';
import 'package:tution_khata/components/custom_app_bar.dart';

import '../constant.dart';

class AboutUs extends StatefulWidget {

  static String id = "about_us";

  const AboutUs({Key? key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {

  Future openDialog(context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: AddStudentAlert()
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: CustomAppBar(str1: 'Add Student' ),
        centerTitle: true,
        elevation: 15,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.6,
          margin: EdgeInsets.all(25),
          padding: EdgeInsets.all(15),
          decoration: CustomBoxDecoration(boxColor),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Text('টিউশন খাতা ', style: TextStyle(fontSize: 27, color: primaryColor, fontWeight: FontWeight.w500),),
              ),

              Container(
                child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', textAlign: TextAlign.center,style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),),
              ),
            ],
          ),
        ),
      ),

    );
  }
}

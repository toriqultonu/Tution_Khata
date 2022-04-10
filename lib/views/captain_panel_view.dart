import 'package:flutter/material.dart';
import 'package:tution_khata/components/buttons/month_button.dart';
import 'package:tution_khata/components/buttons/regular_button.dart';
import 'package:tution_khata/components/buttons/rounded_button.dart';
import 'package:tution_khata/views/add_student_view.dart';

import '../Helper/DatabaseService.dart';
import '../build_lists/build_captain_list.dart';
import '../build_lists/build_unapprovedStudent_list.dart';
import '../components/custom_app_bar.dart';
import '../constant.dart';

class CaptainPanel extends StatefulWidget {
  static String id = "captain_panel";

  @override
  _CaptainPanelState createState() => _CaptainPanelState();
}

class _CaptainPanelState extends State<CaptainPanel> {
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
                decoration: CustomBoxDecoration(boxColor),
                child: Column(
                  children: [
                    Text(
                      "* আপনি একটি ব্যাচ তৈরি করার পর স্বয়ংক্রিয় ভাবে ঐ ব্যাচের জন্য একটি ক্যাপ্টেইন ইউজার তৈরি হয়ে যাবে। ",
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "* আপনার ব্যাচের কোন শিক্ষার্থীকে এই আইডি পাসওয়ার্ডটি দিলে তিনি প্লে স্টোর থেকে \"টিউশন খাতা\" এপটি ইন্সটল করতে পারবেন এবং  নিচের তিনটি অপশন পারবেন। ",
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "* আপনি সেই আবেদন থেকে ভর্তি নিশ্চিত বা বাতিল করতে পারবেন। ",
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "* একজন ব্যাচ ক্যাপ্টেইন ব্যাচের কোন ফি এর তথ্য দেখতে  পারবেন না  ",
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 30,),
                    Spacer(),
                    Row(
                      children: [
                        Spacer(),
                        OutlinedButton(
                            onPressed: () {},
                            child: Text(
                              'Add Student',
                              style: TextStyle(color: Colors.black54),
                            )),
                        Spacer(),
                        OutlinedButton(
                            onPressed: () {},
                            child: Text(
                              'Pending List',
                              style: TextStyle(color: Colors.black54),
                            )),
                        Spacer(),
                        //RegularButton(label: 'View Batch', height: 25, width: 100, color: Colors.white),
                        OutlinedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, AddStudent.id);
                            },
                            child: Text(
                              'View Batch',
                              style: TextStyle(color: Colors.black54),
                            )),
                        Spacer(),
                      ],
                    ),
                    Spacer()
                  ],
                ),
              ),
              SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('Batch List',),
                    Spacer(),
                    Text('Click for change')
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    FutureBuilder(
                        future: DatabaseService.getCaptainList(token),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return Center(
                                  child: Container(
                                    //margin: EdgeInsets.only(top: 120),
                                    width: 150,
                                    height: 150,
                                    child: CircularProgressIndicator(),
                                  ));
                            default:
                              if (snapshot.hasError) {
                                return Center(
                                    child: Container(
                                      child: Text(
                                          'Some error occurred! Contact our support team'),
                                    ));
                              } else {
                                return buildCaptainList(snapshot);
                              }
                          }
                        })
                  ],
                ),
              ),

              RoundedButton(color: primaryColor, title: 'Go Home', onPressed: (){}, height: 4, width: 3)
            ],
          ),
        ),
      ),
    );
  }
}

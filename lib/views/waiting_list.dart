import 'package:flutter/material.dart';
import 'package:tution_khata/Helper/DatabaseService.dart';
import 'package:tution_khata/components/add_student_alert_dialog.dart';
import 'package:tution_khata/components/build_student_list.dart';
import 'package:tution_khata/components/custom_app_bar.dart';

import '../constant.dart';

class WaitingList extends StatefulWidget {

  static String id = "waiting_list";

  const WaitingList({Key? key}) : super(key: key);

  @override
  _WaitingListState createState() => _WaitingListState();
}

class _WaitingListState extends State<WaitingList> {

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
          height: MediaQuery.of(context).size.height * 0.8,
          margin: EdgeInsets.all(25),
          padding: EdgeInsets.all(10),
          decoration: CustomBoxDecoration(secondaryColor),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 17),
                child: Text('Waiting list of Students', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
              ),

              Expanded(
                child: ListView(
                  children: [
                    FutureBuilder(
                        future: DatabaseService.getBatchList(token),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return Center(
                                  child: Container(
                                    margin: EdgeInsets.only(top: 120),
                                    width: 100,
                                    height: 100,
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
                                return buildStudentList(snapshot);
                              }
                          }
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(backgroundColor: primaryColor,onPressed: () { openDialog(context); }, child: Icon(Icons.add),),

    );
  }
}

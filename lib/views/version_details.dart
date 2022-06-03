import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:tution_khata/Helper/DatabaseService.dart';
import 'package:tution_khata/Helper/OpenAPIs.dart';
import 'package:tution_khata/build_lists/build_unapprovedStudent_list.dart';
import 'package:tution_khata/build_lists/build_version_list.dart';
import 'package:tution_khata/components/custom_app_bar.dart';
import 'package:tution_khata/build_lists/build_batch_list.dart';
import 'package:tution_khata/constant.dart';
import 'package:tution_khata/views/update_batch.dart';
import 'package:tution_khata/views/send_sms.dart';
import 'package:tution_khata/views/take_attendance.dart';
import 'package:tution_khata/views/waiting_list.dart';

import '../build_lists/build_student_list.dart';
import 'fee_collection.dart';
import 'home_page.dart';




class VersionDetails extends StatefulWidget {
  static String id = "version_details";



  const VersionDetails({Key? key,}) : super(key: key);

  @override
  _VersionDetailsState createState() => _VersionDetailsState();
}

class _VersionDetailsState extends State<VersionDetails> {

  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        title: CustomAppBar(str1: 'Version Details'),
        centerTitle: true,
        elevation: 15,
      ),
      body: Container(

        child: Column(
          children: [
            SizedBox(height: 30,),
            Expanded(
              child: ListView(
                children: [
                  FutureBuilder(
                      future: OpenAPIs.getPackages(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return Center(
                                child: Container(
                                  margin: EdgeInsets.only(top: 120),
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
                              return buildVersion(snapshot);
                            }
                        }
                      })
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}

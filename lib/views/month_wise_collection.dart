import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tution_khata/Helper/DatabaseService.dart';
import 'package:tution_khata/build_lists/build_unapprovedStudent_list.dart';
import 'package:tution_khata/build_lists/build_unpaidmonths_list.dart';
import 'package:tution_khata/components/custom_app_bar.dart';
import 'package:tution_khata/components/custom_form_field.dart';
import 'package:tution_khata/components/buttons/month_button.dart';
import 'package:tution_khata/components/buttons/rounded_button.dart';
import 'package:tution_khata/components/textformfield_design.dart';

import '../build_lists/build_student_list.dart';
import '../constant.dart';

class MonthWiseCollection extends StatefulWidget {

  static String id = "month_wise_collection";

  const MonthWiseCollection({Key? key}) : super(key: key);

  @override
  _MonthWiseCollectionState createState() => _MonthWiseCollectionState();
}

class _MonthWiseCollectionState extends State<MonthWiseCollection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: CustomAppBar(str1: 'Month wise Collection' ),
        centerTitle: true,
        elevation: 15,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Expanded(
                flex: 1,
                child: Container(
                  height: 155,
                  width: MediaQuery.of(context).size.width* 0.9,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: CustomBoxDecoration(secondaryColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(padding:EdgeInsets.symmetric(vertical: 14),child: Text('Select a month below', style: TextStyle( fontSize: 15, fontWeight: FontWeight.w400),)),
                      Expanded(
                        child: ListView(
                          children: [
                            FutureBuilder(
                                future: DatabaseService.getUnpaidMonth(token, batchId.toString()),
                                builder: (BuildContext context, AsyncSnapshot snapshot) {
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.waiting:
                                      return Center(
                                          child: Container(
                                            margin: EdgeInsets.only(top: 20),
                                            width: 30,
                                            height: 30,
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
                                        return buildUnpaidMonthsCard(snapshot);
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

              //SizedBox(height: 30,),

              // Expanded(
              //   flex: 2,
              //   child: Container(
              //     width: MediaQuery.of(context).size.width*0.9,
              //     padding: EdgeInsets.only(top: 10, left: 14, right: 14, bottom: 14),
              //     decoration: CustomBoxDecoration(secondaryColor),
              //     child: Column(
              //       children: [
              //         Container(child: Text('Select one or more students below'),),
              //         SizedBox(height: 9,),
              //         Expanded(
              //           child: ListView(
              //             children: [
              //               FutureBuilder(
              //                   future: DatabaseService.getStudentList(token),
              //                   builder: (BuildContext context, AsyncSnapshot snapshot) {
              //                     switch (snapshot.connectionState) {
              //                       case ConnectionState.waiting:
              //                         return Center(
              //                             child: Container(
              //                               margin: EdgeInsets.only(top: 120),
              //                               width: 100,
              //                               height: 100,
              //                               child: LoadingAnimationWidget.dotsTriangle(
              //                                 color: primaryColor,
              //                                 size: 100,
              //                               ),
              //                             ));
              //                       default:
              //                         if (snapshot.hasError) {
              //                           return Center(
              //                               child: Container(
              //                                 child: Text(
              //                                     'Some error occurred! Contact our support team'),
              //                               ));
              //                         } else {
              //                           return buildStudentList(snapshot);
              //                         }
              //                     }
              //                   })
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              SizedBox(height: 15,),

              //RoundedButton(color: primaryColor, title: 'Submit', onPressed: (){print('submit');}, height: 45, width: 277)
            ],
          ),
        ),
      ),

    );
  }
}

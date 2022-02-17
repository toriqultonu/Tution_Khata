import 'package:flutter/material.dart';
import 'package:tution_khata/components/custom_app_bar.dart';
import 'package:tution_khata/components/custom_form_field.dart';
import 'package:tution_khata/components/month_button.dart';
import 'package:tution_khata/components/rounded_button.dart';
import 'package:tution_khata/components/textformfield_design.dart';

import '../constant.dart';

class StudentWiseCollection extends StatefulWidget {

  static String id = "student_wise_collection";

  const StudentWiseCollection({Key? key}) : super(key: key);

  @override
  _StudentWiseCollectionState createState() => _StudentWiseCollectionState();
}

class _StudentWiseCollectionState extends State<StudentWiseCollection> {
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
                decoration: CustomBoxDecoration(Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('TOTAL:', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),),
                    Spacer(),
                    Text('0 BDT', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),),
                  ],
                ),
              ),
              SizedBox(height: 40,),

              Container(
                height: 220,
                width: MediaQuery.of(context).size.width* 0.9,
                padding: EdgeInsets.symmetric(vertical: 18),
                decoration: CustomBoxDecoration(secondaryColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: CustomTextFormField('Batch Name', Icon(Icons.ac_unit), TextInputType.text)),
                    Container(padding:EdgeInsets.symmetric(vertical: 14),child: Text('Select a month below', style: TextStyle( fontSize: 15, fontWeight: FontWeight.w400),)),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                MonthButton(label: 'January'),
                                Spacer(),
                                MonthButton(label: 'January'),
                                Spacer(),
                                MonthButton(label: 'January'),
                                Spacer(),
                                MonthButton(label: 'January'),


                              ],
                            ),
                            Spacer(),
                            Row(
                              children: [
                                MonthButton(label: 'January'),
                                Spacer(),
                                MonthButton(label: 'January'),
                                Spacer(),
                                MonthButton(label: 'January'),
                                Spacer(),
                                MonthButton(label: 'January'),


                              ],
                            ),
                            Spacer(),
                            Row(
                              children: [
                                MonthButton(label: 'January'),
                                Spacer(),
                                MonthButton(label: 'January'),
                                Spacer(),
                                MonthButton(label: 'January'),
                                Spacer(),
                                MonthButton(label: 'January'),


                              ],
                            ),

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 40,),

              Container(
                height: 108,
                width: MediaQuery.of(context).size.width* 0.9,
                decoration: CustomBoxDecoration(primaryColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 25,),
                    Text('Month wise Collection', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),),
                    Spacer(),
                    Text('একজন শিক্ষার্থী একাধিক মাসের ফি নিন', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w400),),
                    SizedBox(height: 25,)
                  ],
                ),
              ),

              SizedBox(height: 40,),

              RoundedButton(color: primaryColor, title: 'Submit', onPressed: (){print('submit');}, height: 45, width: 277)
            ],
          ),
        ),
      ),

    );
  }
}

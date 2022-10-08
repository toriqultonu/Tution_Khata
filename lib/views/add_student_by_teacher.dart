import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:tution_khata/build_lists/build_unapprovedStudent_list.dart';
import 'package:tution_khata/components/buttons/custom_flat_button.dart';
import 'package:tution_khata/components/buttons/regular_button.dart';
import 'package:tution_khata/components/buttons/rounded_button.dart';
import 'package:tution_khata/views/waiting_list.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:day_picker/day_picker.dart';
import 'package:day_picker/model/day_in_week.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tution_khata/components/buttons/rounded_button.dart';
import '../components/custom_app_bar.dart';
import '../constant.dart';
import 'package:http/http.dart' as http;

import '../Helper/DatabaseService.dart';
import '../build_lists/build_captain_list.dart';
import '../components/custom_app_bar.dart';
import '../constant.dart';

class AddStudentByTeacher extends StatefulWidget {
  static String id = "add_student_by_teacher";

  @override
  _AddStudentByTeacherState createState() => _AddStudentByTeacherState();
}

class _AddStudentByTeacherState extends State<AddStudentByTeacher> {

  String? selectedValue;
  int? selectedRadio;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController feeController = TextEditingController();

  String? studentName, phone, feeAmount, gender;

  setSelectedRadio(val){
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        title: CustomAppBar(str1: 'Add Student'),
        centerTitle: true,
        elevation: 15,
      ),
      body: Center(
        child: Container(
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: 15, left: 20, right: 20),
                child: Row(
                children: [
                  CustomFlatButton(textColor: Colors.black, title: 'Admission', onPressed: (){}, height: 50, width: 150, icon: Icon(Icons.add)),
                  Spacer(),
                  CustomFlatButton(textColor: Colors.black, title: 'Pending', onPressed: (){
                    Navigator.pushNamed(context, WaitingList.id);
                  }, height: 50, width: 150, icon: Icon(Icons.add)),

                ],
            ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.98,
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(20),
                decoration: CustomBoxDecoration(secondaryColor),
                child: Column(
                  children: [
                    Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.8),
                              spreadRadius: 0.1,
                              blurRadius: 2,
                              offset: Offset(3, 3),
                            )
                          ]),
                      child: TextFormField(
                        controller: nameController,
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          isCollapsed: true,
                          prefixIcon: Icon(Icons.person),
                          labelText: 'Student Name',
                          hintStyle: hintText,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        onChanged: (value){
                          studentName = value;
                        },
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.8),
                              spreadRadius: 0.1,
                              blurRadius: 2,
                              offset: Offset(3, 3),
                            )
                          ]),
                      child: TextFormField(
                        controller: phoneController,
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          isCollapsed: true,
                          prefixIcon: Icon(Icons.phone),
                          labelText: 'Phone No.',
                          hintStyle: hintText,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        onChanged: (value){
                            phone = value;
                        },
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.8),
                              spreadRadius: 0.1,
                              blurRadius: 2,
                              offset: Offset(3, 3),
                            )
                          ]),
                      child: TextFormField(
                        controller: feeController,
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          isCollapsed: true,
                          prefixIcon: Icon(Icons.phone),
                          labelText: 'Fee Amount',
                          hintStyle: hintText,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        onChanged: (value){
                          feeAmount = value;
                        },
                      ),
                    ),
                    Spacer(),
                    Container(

                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6.0),

                          boxShadow: [BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 0.1,
                            blurRadius: 2,
                            offset: Offset(3,3),
                          )
                          ]
                      ),

                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[ Radio(
                            value: 1,
                            groupValue: selectedRadio,
                            activeColor: primaryColor,
                            onChanged: (value){
                              setSelectedRadio(value);
                              print(selectedRadio);
                            },
                          ),
                            Text('Male', style: TextStyle(color: hintTextColor, fontWeight: FontWeight.w300, fontSize: 14),),
                            SizedBox(width: 54,),
                            Radio(
                              value: 2,
                              groupValue: selectedRadio,
                              activeColor: primaryColor,
                              onChanged: (value){
                                setSelectedRadio(value);
                                print(selectedRadio);
                              },
                            ),
                            Text('Female', style: TextStyle(color: hintTextColor, fontWeight: FontWeight.w300, fontSize: 14),),
                          ]
                      ),
                    ),
                    Spacer(),
                    RoundedButton(color: primaryColor, title: 'Do Admission', onPressed: () async {

                      log('$studentName, $phone, $feeAmount ${idToGender[selectedRadio]}');


                      final body1 = jsonEncode({
                        "batchId": batchId,
                        "name": studentName,
                        "phone": phone,
                        "gender": idToGender[selectedRadio].toString(),
                        "batchFee": feeAmount,
                        "guardianName": " ",
                        "guardianPhone": null
                      });

                      final response1 = await http.post(Uri.parse(
                          'https://tution.dcampusweb.com/api/student/create?token='),
                          headers: {
                            'Content-Type': 'application/json',
                            'Accept': 'application/json',
                            'Authorization': 'Bearer $token',
                          },
                          body: body1);

                      if (response1.statusCode == 200) {


                        log("success");
                        Fluttertoast.showToast(
                            msg: "Student admitted successfully",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }

                      else {
                        print("incorrect");
                        Fluttertoast.showToast(
                            msg: "Student admission failed",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }

                      setState(() {
                          nameController.clear();
                          phoneController.clear();
                          feeController.clear();
                      });


                    }, height: 30, width: 15),

                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

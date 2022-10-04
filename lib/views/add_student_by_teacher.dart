import 'package:flutter/material.dart';
import 'package:tution_khata/build_lists/build_unapprovedStudent_list.dart';
import 'package:tution_khata/components/buttons/custom_flat_button.dart';
import 'package:tution_khata/components/buttons/regular_button.dart';
import 'package:tution_khata/components/buttons/rounded_button.dart';
import 'package:tution_khata/views/waiting_list.dart';

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
                    RoundedButton(color: primaryColor, title: 'Do Admission', onPressed: (){


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

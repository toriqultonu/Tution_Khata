import 'package:flutter/material.dart';
import 'package:tution_khata/build_lists/build_student_list.dart';
import 'package:tution_khata/components/rounded_button.dart';

import '../Helper/DatabaseService.dart';
import '../build_lists/build_captain_list.dart';
import '../components/custom_app_bar.dart';
import '../constant.dart';

class AddStudent extends StatefulWidget {
  static String id = "add_student";

  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {

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
                height: MediaQuery.of(context).size.width * 0.9,
                padding: EdgeInsets.all(20),
                decoration: CustomBoxDecoration(secondaryColor),
                child: Column(
                  children: [
                      Row(
                        children: [
                          RoundedButton(color: primaryColor, title: 'Add Student', onPressed: (){}, height: 30, width: 15),
                          Spacer(),
                          RoundedButton(color: primaryColor, title: 'Add Student', onPressed: (){}, height: 30, width: 15),

                        ],
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
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          isCollapsed: true,
                          prefixIcon: Icon(Icons.person),
                          labelText: 'Full Name',
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
                    RoundedButton(color: primaryColor, title: 'Apply Admission', onPressed: (){}, height: 30, width: 15),

                  ],
                ),
              ),
              SizedBox(height: 10,),
              Text('Pending Student List', style: TextStyle(color: Colors.red, fontSize: 18, ),),
              SizedBox(height: 10,),
              Expanded(
                child: ListView(
                  children: [
                    FutureBuilder(
                        future: DatabaseService.getUnapprovedStudentList(token),
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
                                return buildUnapprovedStudentList(snapshot);
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
    );
  }
}

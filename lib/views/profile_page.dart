import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tution_khata/components/rounded_button.dart';
import 'package:tution_khata/components/textformfield_design.dart';

import '../constant.dart';


class ProfilePage extends StatefulWidget {
  static String id = "profile_page";

  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  File? imageFile;
  bool passwordVisible = false;
  int? selectedRadio;

  bool _checked = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
                children:[
                  Container(
                      height: 41,
                      width: 137,
                      margin: EdgeInsets.only(top: 59, bottom: 15),
                      child: Text(
                        'SIGNUP',
                        style: TextStyle(
                            fontFamily: "Open Sans",
                            fontSize: 34,
                            fontWeight: FontWeight.w500,
                            color: primaryColor),
                      )
                  ),
                  Container(
                    width: 70,
                    height: 70,
                    margin: EdgeInsets.only(bottom: 25),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/component/photo.png"),
                        )
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30, left: 18, right: 18),
                    width: 314,
                    height: 625,
                    //color: boxColor,
                    decoration: BoxDecoration(

                        color: boxColor,
                        boxShadow: [BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          spreadRadius: 0.3,
                          blurRadius: 6,
                          offset: Offset(4,5),
                        )
                        ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTextFormField('Full Name', Icon(Icons.person), TextInputType.name),
                        Spacer(),
                        CustomTextFormField('Phone No.', Icon(Icons.phone), TextInputType.phone),
                        Spacer(),
                        CustomTextFormField('Email Address', Icon(Icons.email), TextInputType.emailAddress),
                        Spacer(),
                        CustomTextFormField('District', Icon(Icons.add_location), TextInputType.streetAddress),
                        Spacer(),
                        CustomTextFormField('Upazila/Thana', Icon(Icons.add_location), TextInputType.streetAddress),
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
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            obscureText: !passwordVisible,
                            decoration: InputDecoration(
                              isCollapsed: true,
                              prefixIcon: Icon(Icons.lock),
                              labelText: 'Password',
                              hintStyle: hintText,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,

                            ),
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
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            obscureText: !passwordVisible,
                            decoration: InputDecoration(
                              isCollapsed: true,
                              prefixIcon: Icon(Icons.lock),
                              labelText: 'Password',
                              hintStyle: hintText,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,

                            ),
                          ),
                        ),
                        Spacer(),
                        CheckboxListTile(
                          title: Text('terms and conditions'),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: _checked,
                          onChanged: (value){
                            setState(() {
                              _checked = value!;
                            });
                          },
                          activeColor: primaryColor,
                          checkColor: Colors.white,
                        ),
                        Spacer(),
                        RoundedButton(
                            color: primaryColor,
                            title: "SignUp",
                            onPressed: () {
                              print("SignUp");
                            },
                            height: 45,
                            width: MediaQuery.of(context).size.width)
                      ],
                    ),
                  ),
                ]
            ),
          ),

        ),
      ),
    );
  }
}

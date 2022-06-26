import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tution_khata/components/custom_alert_dialog.dart';
import 'package:tution_khata/components/custom_password_filed.dart';
import 'package:tution_khata/components/buttons/rounded_button.dart';
import 'package:tution_khata/components/textformfield_design.dart';
import 'package:tution_khata/constant.dart';
import 'package:tution_khata/views/register_page.dart';
import 'package:http/http.dart' as http;


import 'home_page.dart';
import 'main_page.dart';

class LoginScreen extends StatefulWidget {
  static String id = "login_screen";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();

  bool passwordVisible1 = false;
  bool _isLoading = false;

  String? phone, password;

  void togglePassword1() {
    setState(() {
      passwordVisible1 = !passwordVisible1;
    });
  }

  Future openDialog(context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: CustomAlertDialog()
      ),
    );
  }

  LogIn(String phone, String password) async{
    Map data = {
      "username": phone,
      "password": password
    };
    var jsonData;
    //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http.post(Uri.parse('https://tution.dcampusweb.com/api/auth/login'), body: data);
    if(response.statusCode == 200){
      //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      jsonData = json.decode(response.body);
      setState(() async {

        _isLoading = false;
        if(jsonData["roles"].toString() == "[teacher]"){
          final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
          sharedPreferences.setString("token", jsonData["access_token"]);
          log('${jsonData["access_token"]}');
          token = jsonData["access_token"];
          await Future.delayed(Duration(seconds: 3));
          Navigator.pushNamed(context, HomeScreen.id);
        }

        else {
          Fluttertoast.showToast(
              msg: " You are not registered! ",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
      });
    }
    else{
      print(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: SafeArea(
              child: Column(
            children: [
              Center(
                child: Container(
                    margin: EdgeInsets.only(top: 78, bottom: 82),
                    width: 105,
                    height: 46,
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                          fontFamily: "Open Sans",
                          fontSize: 34,
                          fontWeight: FontWeight.w400,
                          color: primaryColor),
                    )),
              ),
              Container(
                padding: EdgeInsets.all(22),
                width: 314,
                height: 238,
                //color: boxColor,
                decoration: CustomBoxDecoration(boxColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
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
                        validator: (value) => regexPhone.hasMatch(value!)? null:"Enter correct phone number",
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
                        obscureText: !passwordVisible1,
                        validator: (value) => value != null? null : "Enter password" ,
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
                          suffixIcon: IconButton(
                            color: Colors.grey,
                            splashRadius: 1,
                            icon: Icon(passwordVisible1
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined),
                            onPressed: togglePassword1,
                          ),

                        ),
                        onChanged: (value){
                          password = value;
                        },
                      ),
                    ),
                    Spacer(),
                    RoundedButton(
                        color: primaryColor,
                        title: "Login",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                              LogIn(phone!, password!);

                          }
                          //Navigator.pushNamed(context, HomeScreen.id);
                        },
                        height: 45,
                        width: MediaQuery.of(context).size.width)
                  ],
                ),
              ),
              SizedBox(
                height: 22,
              ),
              GestureDetector(
                onTap: () {
                  openDialog(context);
                },
                child: Container(
                  width: 168,
                  height: 22,
                  child: Text(
                    'FORGET PASSWORD?',
                    style: TextStyle(
                        fontFamily: "Nunito Sans",
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SizedBox(
                height: 104,
              ),
              Container(
                width: 218,
                height: 22,
                child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RegisterScreen.id);
                    },
                    child: Text(
                      'CLICK TO CREATE ACCOUNT',
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontFamily: "Nunito Sans",
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    )),
              ),
            ],
          )),
        ),
      ),
    );
  }
}



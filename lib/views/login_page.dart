import 'package:flutter/material.dart';
import 'package:tution_khata/components/rounded_button.dart';
import 'package:tution_khata/constant.dart';

class LoginScreen extends StatefulWidget {
  static String id = "login_screen";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool passwordVisible = false;

  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        focusColor: Colors.grey,
                        prefixIcon: Icon(Icons.phone),
                        hintText: 'Phone No.',
                        hintStyle: hintText,
                        border: OutlineInputBorder(borderSide: BorderSide.none),
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
                      obscureText: !passwordVisible,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        focusColor: Colors.grey,
                        prefixIcon: Icon(Icons.lock),
                        hintText: 'Phone No.',
                        hintStyle: hintText,
                        suffixIcon: IconButton(
                          color: Colors.grey,
                          splashRadius: 1,
                          icon: Icon(passwordVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined),
                          onPressed: togglePassword,
                        ),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  Spacer(),
                  RoundedButton(
                      color: primaryColor,
                      title: "Login",
                      onPressed: () {
                        print("login");
                      },
                      height: 45,
                      width: MediaQuery.of(context).size.width)
                ],
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Container(
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
            SizedBox(
              height: 104,
            ),
            Container(
              width: 218,
              height: 22,
              child: GestureDetector(
                onTap: (){
                  ///TODO transistion to signup
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
    );
  }
}

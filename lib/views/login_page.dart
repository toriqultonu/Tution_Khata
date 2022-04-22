import 'package:flutter/material.dart';
import 'package:tution_khata/components/custom_alert_dialog.dart';
import 'package:tution_khata/components/custom_password_filed.dart';
import 'package:tution_khata/components/buttons/rounded_button.dart';
import 'package:tution_khata/components/textformfield_design.dart';
import 'package:tution_khata/constant.dart';
import 'package:tution_khata/views/register_page.dart';

import 'home_page.dart';
import 'main_page.dart';

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

  Future openDialog(context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: CustomAlertDialog()
      ),
    );
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
              decoration: CustomBoxDecoration(boxColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextFormField(
                      'Phone No.', Icon(Icons.phone), TextInputType.phone),
                  Spacer(),
                  CustomPasswordField(labelText: 'Password'),
                  Spacer(),
                  RoundedButton(
                      color: primaryColor,
                      title: "Login",
                      onPressed: () {
                        Navigator.pushNamed(context, HomeScreen.id);
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
    );
  }
}



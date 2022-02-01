import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tution_khata/constant.dart';
import 'package:tution_khata/views/login_page.dart';
import 'package:tution_khata/views/register_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: primaryColor,
          secondary: secondaryColor
        ),
        fontFamily: 'Raleway',
      ),

      //initialRoute: LoginScreen.id,

      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
      },

      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: LoginScreen(),
      ),
    );
  }
}




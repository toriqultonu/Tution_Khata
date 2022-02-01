import 'dart:io';

import 'package:flutter/material.dart';

import '../constant.dart';

void main() {
 runApp(RegisterScreen());
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children:[
            Container(
              height: 41,
              width: 137,
              margin: EdgeInsets.only(top: 35, bottom: 15),
              child: Text(
                'SIGNUP',
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 34,
                    fontWeight: FontWeight.w500,
                    color: primaryColor),
              )
              ),
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: imageFile != null ? FileImage(imageFile!):AssetImage("assets/component/photo.png") as ImageProvider,
                  )
                ),
              )
          ]
            ),

          ),
    );
  }
}

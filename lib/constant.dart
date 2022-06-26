
import 'package:flutter/material.dart';

var primaryColor = Color(0xff47C8D7);
var secondaryColor = Color(0xffFBE9D5);
var boxColor = Color(0xffEBEBEB);
var hintTextColor = Color(0xffABABAB);

var upazillaid = '2';

String tonu = '01245789635';

var regexPhone = RegExp(r'(^(\+88|0088)?(01){1}[3456789]{1}(\d){8})$');

var regexPassword = RegExp(r'.{6,}');

bool isValidEmail(String email) {
  return RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(email);
}

String? batchName, date, time, batchId;

TextStyle hintText = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w300,
  fontFamily: "Raleway",

    color: Colors.black
);

var token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvdHV0aW9uLmRjYW1wdXN3ZWIuY29tXC9hcGlcL2F1dGhcL2xvZ2luIiwiaWF0IjoxNjU1NzM5MDU5LCJleHAiOjE2NTgzMzEwNTksIm5iZiI6MTY1NTczOTA1OSwianRpIjoiTGpsbDEwOW5GWlc5OVlpRSIsInN1YiI6MSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.7YZPTW1-b4Vk1cI2i4rzlIoVMc31qL3QvJX15SCCsXg";

var captainToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvdHV0aW9uLmRjYW1wdXN3ZWIuY29tXC9hcGlcL2F1dGhcL2xvZ2luIiwiaWF0IjoxNjU0Mjc2MjI4LCJleHAiOjE2NTY4NjgyMjgsIm5iZiI6MTY1NDI3NjIyOCwianRpIjoiQTRDZUpUcFp1V3Fsc3pLSiIsInN1YiI6MTQ3LCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.w2GDeA0ldQVzddKkOoj_FZ304vC0LSp0vYuHe6arHnU";

BoxDecoration CustomBoxDecoration(Color color) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(6.0),
      boxShadow: [
        BoxShadow(color: Colors.grey.withOpacity(0.8),
            spreadRadius: 0.1,
            blurRadius: 2,
            offset: Offset(3, 3))
      ]
  );
}

InputDecoration getTextFieldDesign({required String labelText, required Icon icon}) {
  return InputDecoration(
      isCollapsed: true,
      //fillColor: Colors.white,
      //focusColor: Colors.grey,
      prefixIcon: icon,
      labelText: labelText,
      hintStyle: hintText,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none
    //border: OutlineInputBorder(borderSide: BorderSide.none),
  );
}





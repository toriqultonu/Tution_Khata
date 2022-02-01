
import 'package:flutter/material.dart';

var primaryColor = Color(0xff47C8D7);
var secondaryColor = Color(0xffFBE9D5);
var boxColor = Color(0xffEBEBEB);
var hintTextColor = Color(0xffABABAB);

var regexPhone = RegExp(r'(^(\+88|0088)?(01){1}[3456789]{1}(\d){8})$');

var regexPassword = RegExp(r'.{6,}');

TextStyle hintText = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w300,
  fontFamily: "Raleway",

    color: Colors.black
);
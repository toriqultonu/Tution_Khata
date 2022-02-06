import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {

  String str1, str2;

  CustomAppBar({required this.str1, required this.str2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(str1,style: TextStyle(color: Colors.black87, fontSize: 22),),
        Text(str2, style: TextStyle(color: Colors.blue , fontSize: 22),)
      ],
    );
  }
}

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {

  String str1;

  CustomAppBar({required this.str1});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(str1,style: TextStyle(color: Colors.white, fontSize: 22),),
      ],
    );
  }
}

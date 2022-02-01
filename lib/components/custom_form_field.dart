import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatelessWidget {


  final Icon icon;
  final String title;
  final bool isPasswordType;
  final double height;
  final double width;
  final TextEditingController givenController;
  final TextInputType textInputType;

  const CustomFormField({required this.icon, required this.title, required this.isPasswordType, required this.height, required this.width, required this.givenController, required this.textInputType});


  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.0),
      ),

      child: TextFormField(
        keyboardType: textInputType,

      ),

    );
  }
}

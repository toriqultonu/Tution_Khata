import 'package:flutter/material.dart';

import '../constant.dart';

class CustomTextFormField extends StatelessWidget {


  final String labelText;
  final Icon icon;
  final TextInputType textInputType;

  CustomTextFormField(this.labelText, this.icon, this.textInputType);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        keyboardType: textInputType,
        decoration: InputDecoration(
          isCollapsed: true,
          prefixIcon: icon,
          labelText: labelText,
          hintStyle: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
        onChanged: (value){

        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../constant.dart';

class CustomPasswordField extends StatefulWidget {


  final String labelText;

  CustomPasswordField({required this.labelText});

  @override
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool passwordVisible = false;

  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 45,
      decoration: CustomBoxDecoration(Colors.white),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        obscureText: !passwordVisible,
        decoration: InputDecoration(
          isCollapsed: true,
          prefixIcon: Icon(Icons.lock),
          labelText: widget.labelText,
          hintStyle: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
            suffixIcon: IconButton(
              color: Colors.grey,
              splashRadius: 1,
              icon: Icon(passwordVisible
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined),
              onPressed: togglePassword,
            ),
        ),
      ),
    );
  }
}

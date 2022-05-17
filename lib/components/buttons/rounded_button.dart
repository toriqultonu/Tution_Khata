import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color color;
  final String title;
  final VoidCallback onPressed;
  final double height;
  final double width;

  RoundedButton({required this.color, required this.title, required this.onPressed, required this.height, required this.width});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(5),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: width,
          height: height,
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 22),
          ),
        ),
      ),
    );
  }
}
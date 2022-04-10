import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  final Color textColor;
  final String title;
  final VoidCallback onPressed;
  final double height;
  final double width;
  final Icon icon;

  CustomFlatButton({required this.textColor, required this.title, required this.onPressed, required this.height, required this.width, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(5),
        child: OutlinedButton.icon(
          label: Text(title,
            style: TextStyle(
                color: textColor,
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          style: OutlinedButton.styleFrom(
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            side: BorderSide(width: 1, color: textColor),
          ),
          icon: Icon(Icons.phone),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
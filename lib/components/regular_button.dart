import 'package:flutter/material.dart';

import '../constant.dart';

class RegularButton extends StatefulWidget {
  final String label;
  final double height;
  final double width;
  final Color color;

  RegularButton({ required this.label, required this.height, required this.width, required this.color});

  @override
  _RegularButtonState createState() => _RegularButtonState();
}

class _RegularButtonState extends State<RegularButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(child: Text(widget.label, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),))
    );
  }
}

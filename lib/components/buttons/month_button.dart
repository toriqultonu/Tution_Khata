import 'package:flutter/material.dart';

import '../../constant.dart';

class MonthButton extends StatefulWidget {
  final String label;
  const MonthButton({Key? key, required this.label}) : super(key: key);

  @override
  _MonthButtonState createState() => _MonthButtonState();
}

class _MonthButtonState extends State<MonthButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 72,
        height: 25,
        decoration: CustomBoxDecoration(Colors.redAccent),
        child: Center(child: Text(widget.label, style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400),))
    );
  }
}

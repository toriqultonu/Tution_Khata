import 'package:flutter/material.dart';

class TextFieldOtp extends StatelessWidget {

  final bool first, last;

  const TextFieldOtp({ required this.first, required this.last});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 47,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Container(
          width: 56,
          height: 47,
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
          child: TextField(
            autofocus: true,
            onChanged: (value){
              if(value.length == 1 && last == false){
                FocusScope.of(context).nextFocus();
              }
              if(value.length == 1 && first == false){
                FocusScope.of(context).previousFocus();
              }
            },
            showCursor: false,
            readOnly: false,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: InputDecoration(
              counter: Offstage(),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}

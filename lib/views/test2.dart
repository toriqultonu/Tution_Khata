import 'dart:developer';

import 'package:day_picker/day_picker.dart';
import 'package:day_picker/model/day_in_week.dart';
import 'package:flutter/material.dart';
import 'package:tution_khata/constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  List<DayInWeek> _days = [
    DayInWeek(
      "Sat",
    ),
    DayInWeek(
      "Sun",
    ),
    DayInWeek(
      "Mon",
    ),
    DayInWeek(
      "Tue",
    ),
    DayInWeek(
      "Wed",
    ),
    DayInWeek(
      "Thu",
    ),
    DayInWeek(
      "Fri",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select days in week"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SelectWeekDays(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              days: _days,
              boxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: primaryColor,
                // gradient: LinearGradient(
                //   begin: Alignment.topLeft,
                //   // 10% of the width, so there are ten blinds.
                //   colors: [
                //     const Color(0xFFE55CE4),
                //     const Color(0xFFBB75FB)
                //   ], // whitish to gray
                //   tileMode:
                //       TileMode.repeated, // repeats the gradient over the canvas
                // ),
              ),
              onSelect: (values) {
                log('$values');
              },
            ),
          ),
        ],
      ),
    );
  }
}

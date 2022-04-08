import 'package:flutter/material.dart';
import 'package:tution_khata/cards/student_card.dart';
import 'package:tution_khata/cards/unapproved_student_card.dart';
import 'package:tution_khata/model/unapprovedstudent.dart';

import '../cards/attendance_card.dart';
import '../constant.dart';
import '../model/attendance.dart';

//snapshot.data[index].name



Widget buildUnapprovedStudentList(AsyncSnapshot snapshot){
  return Container(
    child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          return UnapprovedStudentCard(name: snapshot.data[index].name,
              phone: snapshot.data[index].phone,
              id: snapshot.data[index].id.toString(),);
        }
    ),
  );
}
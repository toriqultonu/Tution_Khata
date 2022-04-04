import 'package:flutter/material.dart';
import 'package:tution_khata/cards/student_card.dart';
import 'package:tution_khata/cards/unapproved_student_card.dart';
import 'package:tution_khata/model/UnapprovedStudent.dart';

import '../components/attendance_card.dart';

Widget buildStudentList(AsyncSnapshot snapshot){
  return ListView.builder(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: snapshot.data.length,
      itemBuilder: (context, index) {
        return StudentCard(studentName: snapshot.data[index].captainName,
            date: 'sat-sun-mon',
            batchId: '3243',
            time: '4.00-5.00');
      }
  );
}

Widget buildAttendanceList(AsyncSnapshot snapshot){
  return Container(
    child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          return AttendanceCard(studentName: snapshot.data[index].captainName,
              date: 'sat-sun-mon',
              batchId: '3243',
              time: '4.00-5.00');
        }
    ),
  );
}

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
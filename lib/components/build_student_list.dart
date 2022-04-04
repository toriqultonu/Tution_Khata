import 'package:flutter/material.dart';
import 'package:tution_khata/components/student_card.dart';
import 'package:tution_khata/components/unapproved_student_card.dart';
import 'package:tution_khata/model/UnapprovedStudent.dart';

import 'attendance_card.dart';

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
              phone: 'sat-sun-mon',
              id: '3243',);
        }
    ),
  );
}
import 'package:flutter/material.dart';
import 'package:tution_khata/components/student_card.dart';

Widget buildStudentList(AsyncSnapshot snapshot){
  return ListView.builder(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: snapshot.data.length,
      itemBuilder: (context, index) {
        return StudentCard(batchName: snapshot.data[index].batchName,
            date: 'sat-sun-mon',
            batchId: '3243',
            time: '4.00-5.00');
      }
  );
}
import 'package:flutter/material.dart';
import 'package:tution_khata/cards/captain_card.dart';

import '../cards/student_card.dart';


Widget buildStudentList(AsyncSnapshot snapshot){
  return ListView.builder(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: snapshot.data.length,
      itemBuilder: (context, index) {
        return StudentCard(
          id: snapshot.data[index].id,
          name: snapshot.data[index].name,
          phone: snapshot.data[index].phone,
          approvalStatus: snapshot.data[index].approvalStatus,
          isActive: snapshot.data[index].isActive
            );
      }
  );
}
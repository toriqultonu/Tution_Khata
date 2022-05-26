import 'package:flutter/material.dart';
import 'package:tution_khata/cards/student_card.dart';
import 'package:tution_khata/cards/unapproved_student_card.dart';
import 'package:tution_khata/cards/unpaid_months_card.dart';
import 'package:tution_khata/model/unapprovedstudent.dart';

import '../cards/attendance_card.dart';
import '../constant.dart';
import '../model/attendance.dart';

//snapshot.data[index].name



Widget buildUnpaidMonthsCard(AsyncSnapshot snapshot){
  return Container(
    child: GridView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 120,
            childAspectRatio: 2.9,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1),
        // physics: ClampingScrollPhysics(),
        // shrinkWrap: true,
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          return UnpaidMonthsCard(id: snapshot.data[index].id,
            monthId: snapshot.data[index].monthId,
            month: snapshot.data[index].month,
            yearId: snapshot.data[index].yearId,
            fee: snapshot.data[index].fee,
            paidAmount: snapshot.data[index].paidAmount,
            waiverAmount: snapshot.data[index].waiverAmount,);
        }
    ),
  );
}
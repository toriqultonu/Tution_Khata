import 'package:flutter/material.dart';
import 'package:tution_khata/cards/version_card.dart';

import '../cards/batch_card.dart';

Widget buildVersion(AsyncSnapshot snapshot){
  return ListView.builder(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: snapshot.data.length,
      itemBuilder: (context, index) {
        return VersionCard(id: snapshot.data[index].id,
            packageName: snapshot.data[index].packageName,
            numberOfDays: snapshot.data[index].numberOfDays,
            packageCharge: snapshot.data[index].packageCharge);
      }
  );
}

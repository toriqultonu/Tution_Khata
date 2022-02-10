import 'package:flutter/material.dart';

import 'batch_card.dart';

Widget buildBatch(AsyncSnapshot snapshot){
  return ListView.builder(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: snapshot.data.length,
      itemBuilder: (context, index) {
        return BatchCard(batchName: snapshot.data[index].batchName,
            date: 'sat-sun-mon',
            batchId: '3243',
            time: '4.00-5.00');
      }
  );
}

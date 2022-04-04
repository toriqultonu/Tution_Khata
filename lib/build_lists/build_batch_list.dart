import 'package:flutter/material.dart';

import '../cards/batch_card.dart';

Widget buildBatch(AsyncSnapshot snapshot){
  return ListView.builder(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: snapshot.data.length,
      itemBuilder: (context, index) {
        return BatchCard(batchName: snapshot.data[index].batchName,
            date: snapshot.data[index].scheduleDays,
            batchId: snapshot.data[index].batchId,
            time: '${snapshot.data[index].startingTime} - ${snapshot.data[index].endingTime}');
      }
  );
}

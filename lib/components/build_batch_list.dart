import 'package:flutter/material.dart';

import 'batch_card.dart';

Widget buildBatch(AsyncSnapshot snapshot){
  return ListView.builder(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: snapshot.data.length,
      itemBuilder: (context, index) {
        return BatchCard(batchName: snapshot.data[index].batchName,
            date: 'sdfasd',
            batchId: 'asdfa',
            time: '4.00-5.00');
      }
  );
}

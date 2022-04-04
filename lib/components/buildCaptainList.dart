import 'package:flutter/material.dart';
import 'package:tution_khata/components/captain_card.dart';


Widget buildCaptainList(AsyncSnapshot snapshot){
  return Container(
    child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          return CaptainCard(captainName: snapshot.data[index].captainName,
              batchId: snapshot.data[index].batchId,
              phone: snapshot.data[index].phone);
        }
    ),
  );
}

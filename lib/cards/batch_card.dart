import 'package:flutter/material.dart';
import 'package:tution_khata/views/batch_details.dart';

import '../views/main_page.dart';

class BatchCard extends StatelessWidget {
  final String batchName;
  final String date;
  final String time;
  final String batchId;
  BatchCard({ required this.batchName, required this.date, required this.batchId, required this.time});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage(batchId: batchId, batchName: batchName, date: date, time: time,)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        alignment: Alignment.center,
        child: Stack(
          children: [
            Container(
              height: 110,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage('assets/component/batchbox.png'),
                    fit: BoxFit.cover,
                  )),


              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text('Batch no.'),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(batchName, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),),
                      SizedBox(height: 5,),
                      Text(date, style: TextStyle(color: Colors.white, fontSize: 14),),
                      SizedBox(height: 3,),
                      Text(time, style: TextStyle(color: Colors.white, fontSize: 14),),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tution_khata/constant.dart';
import 'package:tution_khata/views/batch_details.dart';

class StudentCard extends StatelessWidget {
  final String batchName;
  final String date;
  final String time;
  final String batchId;
  StudentCard({ required this.batchName, required this.date, required this.batchId, required this.time});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, BatchDetails.id);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        alignment: Alignment.center,
        child: Stack(
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: CustomBoxDecoration(Colors.white),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(batchName, style: TextStyle(color: primaryColor, fontSize: 20, fontWeight: FontWeight.w500),),
                      SizedBox(height: 5,),
                      Text('Phone: 2398472304', style: TextStyle( fontSize: 14),),
                      SizedBox(height: 3,),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 5),
                    child: Icon(Icons.chair),
                  )
                ],
              ),

            )
          ],
        ),
      ),
    );
  }
}

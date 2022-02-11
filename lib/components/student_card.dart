import 'package:flutter/material.dart';
import 'package:tution_khata/constant.dart';
import 'package:tution_khata/views/batch_details.dart';

class StudentCard extends StatelessWidget {
  final String studentName;
  final String date;
  final String time;
  final String batchId;
  StudentCard({ required this.studentName, required this.date, required this.batchId, required this.time});
  @override
  Widget build(BuildContext context) {
    return Container(
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
                SizedBox(width: 34,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(studentName, style: TextStyle(color: primaryColor, fontSize: 18, fontWeight: FontWeight.w500),),
                    SizedBox(height: 5,),
                    Text('Phone: 2398472304', style: TextStyle( fontSize: 14),),
                    SizedBox(height: 3,),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: (){
                    print('settings');
                  },
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(Icons.settings),
                  ),
                )
              ],
            ),

          )
        ],
      ),
    );
  }
}

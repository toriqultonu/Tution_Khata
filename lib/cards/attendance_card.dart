import 'package:flutter/material.dart';
import 'package:tution_khata/constant.dart';
import 'package:tution_khata/views/batch_details.dart';

class AttendanceCard extends StatefulWidget {
  final String studentName;
  final String date;
  final String time;
  final String batchId;
  AttendanceCard({ required this.studentName, required this.date, required this.batchId, required this.time});

  @override
  _AttendanceCardState createState() => _AttendanceCardState();
}

class _AttendanceCardState extends State<AttendanceCard> {

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      alignment: Alignment.center,
      child: Stack(
        children: [
          GestureDetector(
            onTap: (){
              if(!isChecked)
                isChecked = true;
              else
                isChecked = false;
              setState(() {
              });
            },
            child: Container(
              height: 45,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: CustomBoxDecoration(isChecked?primaryColor:secondaryColor),
              child: Row(
                children: [
                  SizedBox(width: 34,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.studentName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                    ],
                  ),
                  Spacer(),
                  // Container(
                  //   child: CheckboxListTile(
                  //     //controlAffinity: ListTileControlAffinity.leading,
                  //     value: widget.isChecked,
                  //     onChanged: (value){
                  //       setState(() {
                  //         widget.isChecked = value!;
                  //       });
                  //     },
                  //     activeColor: primaryColor,
                  //     checkColor: Colors.white,
                  //   ),
                  // )
                ],
              ),

            ),
          )
        ],
      ),
    );
  }
}

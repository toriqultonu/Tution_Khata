import 'package:flutter/material.dart';
import 'package:tution_khata/constant.dart';
import 'package:tution_khata/views/batch_details.dart';

class UnapprovedStudentCard extends StatefulWidget {
  final String id;
  final String name;
  final String phone;

  UnapprovedStudentCard({required this.id, required this.name, required this.phone});

  @override
  _UnapprovedStudentCardState createState() => _UnapprovedStudentCardState();
}

class _UnapprovedStudentCardState extends State<UnapprovedStudentCard> {

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
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 5),
              height: 50,
              width: MediaQuery.of(context).size.width * 0.98,
              decoration: CustomBoxDecoration(boxColor),
              child: Row(
                children: [
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      Text("Name: ${widget.name}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
                      Spacer(),
                      Text("Phone: ${widget.phone}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
                      Spacer(),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.delete),
                  SizedBox(width: 20,),
                ],
              ),

            ),
          )
        ],
      ),
    );
  }
}

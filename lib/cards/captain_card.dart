import 'package:flutter/material.dart';
import 'package:tution_khata/constant.dart';
import 'package:tution_khata/views/batch_details.dart';

import '../views/edit_captain_view.dart';

class CaptainCard extends StatefulWidget {
  final String batchId;
  final String captainName;
  final String phone;

  CaptainCard({required this.batchId, required this.captainName, required this.phone});

  @override
  _CaptainCardState createState() => _CaptainCardState();
}

class _CaptainCardState extends State<CaptainCard> {

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
              height: 65,
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
                      Text("Batch Id: ${widget.batchId}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
                      Spacer(),
                      Text("Captain Name: ${widget.captainName}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
                      Spacer(),
                      Text("Phone: ${widget.phone}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
                      Spacer(),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EditCaptain(
                        batchId: widget.batchId,
                        name: widget.captainName,
                        phone: widget.phone,
                      )));
                    },
                      child: Icon(Icons.edit)),
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

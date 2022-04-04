import 'package:flutter/material.dart';
import 'package:tution_khata/constant.dart';
import 'package:tution_khata/views/batch_details.dart';

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
              height: 63,
              width: MediaQuery.of(context).size.width * 0.98,
              decoration: CustomBoxDecoration(secondaryColor),
              child: Row(
                children: [
                  SizedBox(width: 34,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Batch Id: ${widget.batchId}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                      Spacer(),
                      Text("Captain Name: ${widget.captainName}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                      Spacer(),
                      Text("Phone: ${widget.phone}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
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

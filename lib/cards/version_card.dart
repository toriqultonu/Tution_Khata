import 'package:flutter/material.dart';
import 'package:tution_khata/constant.dart';
import 'package:tution_khata/views/batch_details.dart';

import '../views/main_page.dart';

class VersionCard extends StatefulWidget {
  final id;
  final packageName;
  final numberOfDays;
  final packageCharge;

  VersionCard({ required this.id, required this.packageName, required this.numberOfDays, required this.packageCharge});

  @override
  State<VersionCard> createState() => _VersionCardState();
}

class _VersionCardState extends State<VersionCard> {
  bool isSpinning  = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          if(isSpinning)
            isSpinning = false;
          else
            isSpinning = true;
        });
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        alignment: Alignment.center,
        child: Stack(
          children: [

            Container(
              height: 110,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: CustomBoxDecoration(boxColor),

              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text('Batch no.'),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${widget.packageName}', style: TextStyle( fontSize: 20, fontWeight: FontWeight.w500),),
                      SizedBox(height: 5,),
                      Text('Number of Days: ${widget.numberOfDays}', style: TextStyle(fontSize: 14),),
                      SizedBox(height: 3,),
                      Text('Charge: ${widget.packageCharge}', style: TextStyle( fontSize: 14),),
                    ],
                  ),
                ],
              ),
            ),

            isSpinning?Container(
                height: 110,
                width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.black26),

              //alignment: Alignment.center,
              child: Center(child: CircularProgressIndicator())
            ):Container(height: 110,
              width: MediaQuery.of(context).size.width * 0.9,)





          ],
        ),
      ),
    );
  }
}

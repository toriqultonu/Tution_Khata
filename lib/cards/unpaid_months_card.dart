import 'package:flutter/material.dart';
import 'package:tution_khata/constant.dart';
import 'package:tution_khata/views/batch_details.dart';

class UnpaidMonthsCard extends StatefulWidget {
  final id;
  final monthId;
  final month;
  final yearId;
  final fee;
  final paidAmount;
  final waiverAmount;

  UnpaidMonthsCard({required this.id, required this.monthId,required this.month,required this.yearId,required this.fee,required this.paidAmount,required this.waiverAmount});

  @override
  _UnpaidMonthsCardState createState() => _UnpaidMonthsCardState();
}

class _UnpaidMonthsCardState extends State<UnpaidMonthsCard> {

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
              width: 90,
              height: 25,
              margin: EdgeInsets.only(bottom: 5),
              decoration: CustomBoxDecoration(Colors.redAccent),
              child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      Text("${widget.month}, ${widget.yearId}", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),),
                      Spacer(),
                    ],
                  ),

            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../constant.dart';

class CustomInfoShower extends StatelessWidget {

  final Icon icon;
  final String labelText;
  final String mainInfo;


  CustomInfoShower({required this.icon, required this.labelText, required this.mainInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width *0.9,
      decoration: CustomBoxDecoration(Colors.white),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 14),
            child: icon,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(labelText, style: TextStyle(color: Colors.black45, fontWeight: FontWeight.w300, fontSize: 11),),
                Spacer(),
                Text(mainInfo, style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),),
              ],
            ),
          )
        ],
      ),
    );
  }
}

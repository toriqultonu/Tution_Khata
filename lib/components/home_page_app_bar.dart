import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,

      child: Row(
        children: [
          Container(
            width: 48.0,
            height: 48.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage("assets/component/profiledemo.png"),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: 16,),
          Container(
            height: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text('Mojura Moula', style: TextStyle(fontFamily: 'Nunito Sans', fontWeight: FontWeight.w600, fontSize: 14, color: Colors.white),),
                ),
                Spacer(),
                Container(
                  child: Text('Subscription: Free Trial', style: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.w400, fontSize: 14, color: Colors.white),),
                ),
                Spacer(),
                Container(
                  child: Text('SMS Balance: 0 (Click to Recharge)', style: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.w400, fontSize: 14, color: Colors.white),),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

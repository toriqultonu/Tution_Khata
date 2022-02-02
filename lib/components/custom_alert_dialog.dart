import 'package:flutter/material.dart';
import 'package:tution_khata/components/rounded_button.dart';
import 'package:tution_khata/components/textformfield_design.dart';

import '../constant.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        width: 314,
        height: 238,
        //color: boxColor,
        decoration: BoxDecoration(color: boxColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text('FORGOT PASSWORD?', style: TextStyle(fontFamily: 'Raleway', fontSize: 17, fontWeight: FontWeight.w500),),
            ),
            SizedBox(height: 4,),
            Center(
              child: Text('Please enter your phone no to receive code', style: TextStyle(fontFamily: 'Raleway', fontSize: 14,fontWeight: FontWeight.w400 ),),
            ),

            SizedBox(height: 31,),
            CustomTextFormField(
                'Phone No.', Icon(Icons.phone), TextInputType.phone),
            Spacer(),
            RoundedButton(
                color: primaryColor,
                title: "Send",
                onPressed: () {
                  print("login");
                },
                height: 38,
                width: MediaQuery.of(context).size.width)
          ],
        )
    );
  }
}

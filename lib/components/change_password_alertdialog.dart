import 'package:flutter/material.dart';
import 'package:tution_khata/components/rounded_button.dart';
import 'package:tution_khata/components/textformfield_design.dart';
import 'package:tution_khata/views/phone_verification_page.dart';

import '../constant.dart';

class ChangePasswordAlert extends StatelessWidget {
  const ChangePasswordAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width *85,
        height: 350,
        //color: boxColor,
        decoration: BoxDecoration(color: boxColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text('Change Your Password', style: TextStyle(fontFamily: 'Raleway', fontSize: 17, fontWeight: FontWeight.w500),),
            ),

            SizedBox(height: 31,),
            CustomTextFormField(
                'Phone No.', Icon(Icons.phone), TextInputType.phone),
            Spacer(),
            CustomTextFormField(
                'Phone No.', Icon(Icons.phone), TextInputType.phone),
            Spacer(),
            CustomTextFormField(
                'Phone No.', Icon(Icons.phone), TextInputType.phone),
            Spacer(),
            RoundedButton(
                color: primaryColor,
                title: "Send",
                onPressed: () {
                  Navigator.pushNamed(context, PhoneVerification.id);
                },
                height: 38,
                width: MediaQuery.of(context).size.width)
          ],
        )
    );
  }
}

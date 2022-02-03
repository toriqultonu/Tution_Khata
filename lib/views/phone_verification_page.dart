import 'package:flutter/material.dart';
import 'package:tution_khata/components/rounded_button.dart';
import 'package:tution_khata/components/text_field_otp.dart';

import '../constant.dart';

// void main() {
// runApp(PhoneVerification());
// }

class PhoneVerification extends StatefulWidget {

  static String id = "phone_verification";

  const PhoneVerification({Key? key}) : super(key: key);

  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 34,),
                Container(
                  padding: EdgeInsets.only(top: 18,left: 23, right: 23, bottom: 20),
                  height: 143,
                  width: 333,
                  decoration: BoxDecoration(color: boxColor, boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 0.3,
                      blurRadius: 6,
                      offset: Offset(4, 5),
                    )
                  ]),
                  child: Column(
                    children: [
                      Container(child: Text('Please enter the 4 digit that have sent to your phone', textAlign: TextAlign.center,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,),),),
                      Spacer(),
                      Row(
                        children: [
                          TextFieldOtp(first: true, last: false),
                          Spacer(),
                          TextFieldOtp(first: true, last: false),
                          Spacer(),
                          TextFieldOtp(first: true, last: false),
                          Spacer(),
                          TextFieldOtp(first: true, last: false),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                RoundedButton(color: primaryColor, title: 'Verify Now', onPressed: () {
                  print('verify');
                }, height: 45, width: 277),
                SizedBox(height: 25,),
                Container(
                  child: Text('Wait till sending your code again ', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),),
                )
              ],
            ),
          ),
        ),
    );
  }
}

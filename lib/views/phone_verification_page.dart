import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pinput.dart';
import 'package:tution_khata/components/buttons/rounded_button.dart';
import 'package:tution_khata/components/text_field_otp.dart';
import 'package:tution_khata/views/home_page.dart';
import 'package:http/http.dart' as http;


import '../constant.dart';

// void main() {
// runApp(PhoneVerification());
// }

class PhoneVerification extends StatefulWidget {

  static String id = "phone_verification";

  final phoneNumber;

  const PhoneVerification({Key? key, this.phoneNumber}) : super(key: key);

  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {

  var code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: primaryColor),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Column(
                children: [
                  SizedBox(height: 34,),
                  Container(
                    width: 279,
                    height: 300,
                    margin: EdgeInsets.only(bottom: 25),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/component/rafiki.png"),
                        )
                    ),
                  ),
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
                        // Row(
                        //   children: [
                        //     TextFieldOtp(first: true, last: false),
                        //     Spacer(),
                        //     TextFieldOtp(first: true, last: false),
                        //     Spacer(),
                        //     TextFieldOtp(first: true, last: false),
                        //     Spacer(),
                        //     TextFieldOtp(first: true, last: false),
                        //   ],
                        // ),
                        Pinput(
                          defaultPinTheme: PinTheme(
                            width: 56,
                            height: 56,
                            textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
                            decoration: CustomBoxDecoration(Colors.white)

                          ),
                          onCompleted: (pin) => code = pin

                        )

                   ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  RoundedButton(color: primaryColor, title: 'Verify Now', onPressed: () async {

                    final body1 = jsonEncode({
                      "otp":code,
                      "phone":phoneToVerify
                    });

                    final response1 = await http.post(Uri.parse(
                        'https://tution.dcampusweb.com/api/otp/verification'),
                        headers: {
                          'Content-Type': 'application/json',
                          'Accept': 'application/json',

                        },
                        body: body1);
                    final jsonData1 = json.decode(response1.body);

                    if (response1.statusCode == 200) {
                      log("success");
                      Fluttertoast.showToast(
                          msg: "Account is verified",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                      await Future.delayed(Duration(seconds: 1));
                      Navigator.pop(context);
                    }

                    else {
                      log("incorrect");
                      Fluttertoast.showToast(
                          msg: "Account is not verified! Enter right code",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }



                    log('$code');
                    //Navigator.pushNamed(context, HomeScreen.id);
                  }, height: 45, width: 277),
                  SizedBox(height: 25,),
                  Container(
                    child: Text('Wait till sending your code again ', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),),
                  )
                ],
              ),
            ),
          ),
        ),
    );
  }
}

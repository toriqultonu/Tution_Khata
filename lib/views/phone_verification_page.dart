import 'package:flutter/material.dart';
import 'package:tution_khata/components/text_field_otp.dart';

// void main() {
// runApp(PhoneVerification());
// }

class PhoneVerification extends StatelessWidget {

  static String id = "phone_verification";

  const PhoneVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Container(
          child: Image.asset("assets/component/rafiki.png"),
        ),
      ),
    );
  }
}

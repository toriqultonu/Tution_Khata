import 'package:flutter/material.dart';
import 'package:tution_khata/components/buttons/custom_flat_button.dart';
import 'package:tution_khata/components/custom_app_bar.dart';
import 'package:tution_khata/components/buttons/rounded_button.dart';
import 'package:tution_khata/components/textformfield_design.dart';

import '../constant.dart';


class SMSPurchase extends StatefulWidget {

  static String id = "sms_purchase";

  final studentName;
  final studentPhone;
  final studentId;

  const SMSPurchase({Key? key, this.studentName, this.studentPhone, this.studentId}) : super(key: key);

  @override
  _SMSPurchaseState createState() => _SMSPurchaseState();
}

class _SMSPurchaseState extends State<SMSPurchase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: CustomAppBar(str1: 'SMS Purchase' ),
        centerTitle: true,
        elevation: 15,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              SizedBox(height: 60,),
              Row(
                children: [
                  Text('Per SMS',style: TextStyle(fontSize: 22),),
                  Spacer(),
                  Text('BDT 0.30 Tk',style: TextStyle(fontSize: 22),),
                ],
              ),
              SizedBox(height: 10,),
              Divider(
                color: Colors.black,
                thickness: 2,
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text('Per SMS',style: TextStyle(fontSize: 22),),
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: TextFormField(
                      style: TextStyle(fontSize: 20),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(20)
                            )
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Divider(
                color: Colors.black,
                thickness: 2,
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text('In Amount',style: TextStyle(fontSize: 22),),
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: TextFormField(
                      style: TextStyle(fontSize: 20),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(20)
                            )
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Divider(
                color: Colors.black,
                thickness: 2,
              ),
              SizedBox(height: 20,),
              RoundedButton(color: primaryColor, title: 'Purchase', onPressed: (){}, height: 40, width: 50),
              SizedBox(height: MediaQuery.of(context).size.height * 0.25,),
              RoundedButton(color: primaryColor, title: 'Go Home', onPressed: (){}, height: 40, width: 200),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}

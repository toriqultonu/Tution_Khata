import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tution_khata/components/custom_app_bar.dart';
import 'package:tution_khata/components/buttons/rounded_button.dart';
import 'package:tution_khata/components/textformfield_design.dart';

import '../constant.dart';


class SendSMS extends StatefulWidget {

  static String id = "send_SMS";

  const SendSMS({Key? key}) : super(key: key);

  @override
  _SendSMSState createState() => _SendSMSState();
}

class _SendSMSState extends State<SendSMS> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: CustomAppBar(str1: 'Send SMS' ),
          centerTitle: true,
          elevation: 15,
        ),

        body: Center(
          child: Container(
            child: Column(
              children: [
               Spacer(),

                Container(
                  height: 280,
                  width: MediaQuery.of(context).size.width* 0.9,
                  decoration: CustomBoxDecoration(secondaryColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        width: MediaQuery.of(context).size.width* 0.9,
                        child: Row(
                          children: [
                            Text('Total SMS Balance: ', style: TextStyle( fontSize: 15, fontWeight: FontWeight.w400),),
                            Spacer(),
                            Text('0', style: TextStyle( fontSize: 15, fontWeight: FontWeight.w400),)
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 20,
                        width: 120,
                        
                        padding: EdgeInsets.only(right: 20),
                        decoration: CustomBoxDecoration(Colors.redAccent),
                        child: Text('Recharge SMS', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400),),
                      ),
                      Spacer(),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        width: MediaQuery.of(context).size.width* 0.9,
                        height: 173,
                        padding: EdgeInsets.all(8),

                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black
                          ),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            isCollapsed: true,

                            labelText: 'Write down your message...',
                            hintStyle: TextStyle(color: Colors.black12, fontSize: 17, fontWeight: FontWeight.w400),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,

                          ),
                        ),
                      ),
                      SizedBox(height: 25,)
                    ],
                  ),
                ),

                Spacer(),

                Container(
                  height: 158,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width* 0.9,
                  decoration: CustomBoxDecoration(secondaryColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      CustomTextFormField('Batch Name', Icon(Icons.phone), TextInputType.phone),
                      Spacer(),
                      CustomTextFormField('Select Send Type: All Student', Icon(Icons.phone), TextInputType.phone),
                      Spacer()
                    ],
                  ),
                ),

                Spacer(),

                RoundedButton(color: primaryColor, title: 'Send', onPressed: (){print('send');}, height: 45, width: 277)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

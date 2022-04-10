import 'package:flutter/material.dart';
import 'package:tution_khata/components/buttons/custom_flat_button.dart';
import 'package:tution_khata/components/custom_app_bar.dart';
import 'package:tution_khata/components/buttons/rounded_button.dart';
import 'package:tution_khata/components/textformfield_design.dart';

import '../constant.dart';


class PersonalSMS extends StatefulWidget {

  static String id = "personal_SMS";

  final studentName;
  final studentPhone;
  final studentId;

  const PersonalSMS({Key? key, this.studentName, this.studentPhone, this.studentId}) : super(key: key);

  @override
  _PersonalSMSState createState() => _PersonalSMSState();
}

class _PersonalSMSState extends State<PersonalSMS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: CustomAppBar(str1: 'Send SMS' ),
          centerTitle: true,
          elevation: 15,
        ),

        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 30,),
                Text(widget.studentName, style: TextStyle(fontSize: 22),),
                SizedBox(height: 10,),
                Text(widget.studentPhone, style: TextStyle(fontSize: 18),),
                SizedBox(height: 10,),
                Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text('Enter SMS Content'),
                    Spacer(),
                    Text('SMS Balance: 1120'),
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                        width: MediaQuery.of(context).size.width* 0.9,
                        height: 173,
                        padding: EdgeInsets.all(8),
                        child: TextFormField(
                          maxLength: 160,
                          minLines: 15,
                          maxLines: 15,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10)
                              )
                            ),
                          ),
                        ),
                      ),
                SizedBox(height: 10,),
                Row(
                  children: [
                      CustomFlatButton(textColor: primaryColor, title: 'Purchase SMS', onPressed: (){}, height: 10, width: 30, icon: Icon(Icons.phone)),
                      Spacer(),
                    CustomFlatButton(textColor: primaryColor, title: 'Send SMS', onPressed: (){}, height: 10, width: 30, icon: Icon(Icons.phone)),
                  ],
                ),
                Spacer(),

                RoundedButton(color: primaryColor, title: 'Go Home', onPressed: (){print('Go Home');}, height: 45, width: 277)
              ],
            ),
          ),
        ),
      );
  }
}

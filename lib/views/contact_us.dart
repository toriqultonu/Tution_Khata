import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tution_khata/components/custom_app_bar.dart';
import 'package:tution_khata/components/rounded_button.dart';
import 'package:tution_khata/components/textformfield_design.dart';

import '../constant.dart';


class ContactUs extends StatefulWidget {

  static String id = "contact_us";

  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
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
                SizedBox(height: 40,),

                Container(
                  height: 380,
                  width: MediaQuery.of(context).size.width* 0.9,
                  decoration: CustomBoxDecoration(boxColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        width: MediaQuery.of(context).size.width* 0.9,
                        child:
                            Text('If you have any queries, Please feel free to ask.', style: TextStyle( fontSize: 17, fontWeight: FontWeight.w400),),
                      ),
                      SizedBox(height: 16,),


                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          width: MediaQuery.of(context).size.width* 0.9,
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
                      ),
                      SizedBox(height: 16,),
                      RoundedButton(color: primaryColor, title: 'Send', onPressed: (){print('sent');}, height: 45, width: 277)
                    ],
                  ),
                ),

                Spacer(),

                Container(
                    child: Text('Or Connect us by', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                ),
                SizedBox(height: 13,),

                Container(
                  height: 82,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  width: MediaQuery.of(context).size.width* 0.9,
                  decoration: CustomBoxDecoration(boxColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Icon(Icons.margin, size: 50,),
                      Spacer(),
                      Icon(Icons.margin, size: 50,),
                      Spacer(),
                      Icon(Icons.margin, size: 50,),

                    ],
                  ),
                ),

                Spacer(),


              ],
            ),
          ),
        ),
      ),
    );
  }
}

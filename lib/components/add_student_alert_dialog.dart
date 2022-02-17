import 'package:flutter/material.dart';
import 'package:tution_khata/components/custom_password_filed.dart';
import 'package:tution_khata/components/rounded_button.dart';
import 'package:tution_khata/components/textformfield_design.dart';
import 'package:tution_khata/views/phone_verification_page.dart';

import '../constant.dart';

class AddStudentAlert extends StatefulWidget {


  @override
  _AddStudentAlertState createState() => _AddStudentAlertState();
}

class _AddStudentAlertState extends State<AddStudentAlert> {
  int? selectedRadio;

  setSelectedRadio(val){
    setState(() {
      selectedRadio = val;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        height: 350,
        //color: boxColor,
        decoration: BoxDecoration(color: secondaryColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextFormField('Batch Name', Icon(Icons.margin), TextInputType.text),
            Spacer(),
            CustomTextFormField('Student Name', Icon(Icons.margin), TextInputType.text),
            Spacer(),
            CustomTextFormField('Phone No.', Icon(Icons.phone), TextInputType.phone),
            Spacer(),
            Container(

              width: MediaQuery.of(context).size.width,
              height: 45,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.0),

                  boxShadow: [BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                    spreadRadius: 0.1,
                    blurRadius: 2,
                    offset: Offset(3,3),
                  )
                  ]
              ),

              child: Row(
                  children:[ Radio(
                    value: 1,
                    groupValue: selectedRadio,
                    activeColor: primaryColor,
                    onChanged: (value){
                      setSelectedRadio(value);
                      print(selectedRadio);
                    },
                  ),
                    Text('Male', style: TextStyle(color: hintTextColor, fontWeight: FontWeight.w300, fontSize: 14),),
                    SizedBox(width: 54,),
                    Radio(
                      value: 2,
                      groupValue: selectedRadio,
                      activeColor: primaryColor,
                      onChanged: (value){
                        setSelectedRadio(value);
                        print(selectedRadio);
                      },
                    ),
                    Text('Female', style: TextStyle(color: hintTextColor, fontWeight: FontWeight.w300, fontSize: 14),),
                  ]
              ),
            ),
            RoundedButton(
                color: primaryColor,
                title: "Add",
                onPressed: () {
                  Navigator.pushNamed(context, PhoneVerification.id);
                },
                height: 45,
                width: 161)
          ],
        )
    );
  }
}

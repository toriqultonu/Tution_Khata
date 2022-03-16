import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tution_khata/components/rounded_button.dart';
import 'package:tution_khata/components/textformfield_design.dart';
import 'package:dropdown_button2/dropdown_button2.dart';


import '../constant.dart';

// void main() {
//  runApp(RegisterScreen());
// }

class RegisterScreen extends StatefulWidget {
  static String id = "register_screen";

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  File? imageFile;
  bool passwordVisible = false;
  int? selectedRadio;
  late String _img64;

  bool _checked = false;

  List<String> upazillas = ["Tonu", "Toriqul", "Robin"];
  String? selectedValue;
  List<String> items = [
    'A', 'B', 'C', 'D', 'k', 'y', 'e','r','s','v','m','b','z','sfa'
  ];
  late String upzilla;
  String dropdownvalue = 'Item 1';

  chooseImage(ImageSource source) async {
    final pickedFile = await ImagePicker().getImage(source: source);
    setState(() {
      imageFile = File(pickedFile!.path);
    });
    final imageBytes = await File(pickedFile!.path).readAsBytesSync();
    _img64 = base64Encode(imageBytes);
  }

  setSelectedRadio(val){
    setState(() {
      selectedRadio = val;
    });
  }

  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children:[
                Container(
                  height: 41,
                  width: 137,
                  margin: EdgeInsets.only(top: 59, bottom: 15),
                  child: Text(
                    'SIGNUP',
                    style: TextStyle(
                        fontFamily: "Open Sans",
                        fontSize: 34,
                        fontWeight: FontWeight.w500,
                        color: primaryColor),
                  )
                  ),
                  GestureDetector(
                    onTap: (){
                      chooseImage(ImageSource.gallery);
                    },
                    child: Container(
                      width: 70,
                      height: 70,
                      margin: EdgeInsets.only(bottom: 25),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: imageFile != null ? FileImage(imageFile!):AssetImage("assets/component/photo.png") as ImageProvider,
                        )
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30, left: 18, right: 18),
                    width: 314,
                    height: 625,
                    //color: boxColor,
                    decoration: BoxDecoration(

                        color: boxColor,
                        boxShadow: [BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          spreadRadius: 0.3,
                          blurRadius: 6,
                          offset: Offset(4,5),
                        )
                        ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTextFormField('Full Name', Icon(Icons.person), TextInputType.name),
                        Spacer(),
                        CustomTextFormField('Phone No.', Icon(Icons.phone), TextInputType.phone),
                        Spacer(),
                        CustomTextFormField('Email Address', Icon(Icons.email), TextInputType.emailAddress),
                        Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.8),
                                  spreadRadius: 0.1,
                                  blurRadius: 2,
                                  offset: Offset(3, 3),
                                )
                              ]),
                          // child: DropdownButtonHideUnderline(
                          //   child: DropdownButton2(
                          //     //icon: Icon(Icons.map),
                          //     hint: Text(
                          //       'District',
                          //       style: hintText,
                          //     ),
                          //
                          //     items: items
                          //         .map((item) =>
                          //         DropdownMenuItem<String>(
                          //           value: item,
                          //           child: Text(
                          //             item,
                          //             style: const TextStyle(
                          //               fontSize: 14,
                          //             ),
                          //           ),
                          //         ))
                          //         .toList(),
                          //     value: selectedValue,
                          //     onChanged: (value) {
                          //       setState(() {
                          //         selectedValue = value as String;
                          //       });
                          //     },
                          //     buttonHeight: 40,
                          //     buttonWidth: 140,
                          //     itemHeight: 40,
                          //   ),
                          // ),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.person),
                            ),
                            hint: Text('District'),
                            items: items.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                            value: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value;
                              });
                              print(selectedValue);
                              print('tonu');
                            },
                          ),
                        ),
                        Spacer(),
                        Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.8),
                                spreadRadius: 0.1,
                                blurRadius: 2,
                                offset: Offset(3, 3),
                              )
                            ]),
                        // child: DropdownButtonHideUnderline(
                        //   child: DropdownButton2(
                        //     //icon: Icon(Icons.map),
                        //     hint: Text(
                        //       'District',
                        //       style: hintText,
                        //     ),
                        //
                        //     items: items
                        //         .map((item) =>
                        //         DropdownMenuItem<String>(
                        //           value: item,
                        //           child: Text(
                        //             item,
                        //             style: const TextStyle(
                        //               fontSize: 14,
                        //             ),
                        //           ),
                        //         ))
                        //         .toList(),
                        //     value: selectedValue,
                        //     onChanged: (value) {
                        //       setState(() {
                        //         selectedValue = value as String;
                        //       });
                        //     },
                        //     buttonHeight: 40,
                        //     buttonWidth: 140,
                        //     itemHeight: 40,
                        //   ),
                        // ),
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.person),
                          ),
                          hint: Text('Upazila/Thana'),
                          items: items.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                          value: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value;
                            });
                            print(selectedValue);
                            print('tonu');
                          },
                        ),
                      ),
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
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            obscureText: !passwordVisible,
                            decoration: InputDecoration(
                              isCollapsed: true,
                              prefixIcon: Icon(Icons.lock),
                              labelText: 'Password',
                              hintStyle: hintText,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              suffixIcon: IconButton(
                                color: Colors.grey,
                                splashRadius: 1,
                                icon: Icon(passwordVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined),
                                onPressed: togglePassword,
                              ),

                            ),
                          ),
                        ),
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
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            obscureText: !passwordVisible,
                            decoration: InputDecoration(
                              isCollapsed: true,
                              prefixIcon: Icon(Icons.lock),
                              labelText: 'Password',
                              hintStyle: hintText,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              suffixIcon: IconButton(
                                color: Colors.grey,
                                splashRadius: 1,
                                icon: Icon(passwordVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined),
                                onPressed: togglePassword,
                              ),

                            ),
                          ),
                        ),
                        Spacer(),
                        CheckboxListTile(
                          title: Text('terms and conditions'),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: _checked,
                          onChanged: (value){
                            setState(() {
                              _checked = value!;
                            });
                          },
                          activeColor: primaryColor,
                          checkColor: Colors.white,
                        ),
                        Spacer(),
                        RoundedButton(
                            color: primaryColor,
                            title: "SignUp",
                            onPressed: () {
                              print("SignUp");
                            },
                            height: 45,
                            width: MediaQuery.of(context).size.width)
                      ],
                    ),
                  ),
              ]
                ),
            ),

            ),
        ),
    );
  }
}


DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
  value: item,
  child: Container(
    //padding: EdgeInsets.all(8.0),
    child: Text(
      item,
      style: TextStyle(
        color: Color(0xFF0F0909),
      ),
    ),
  ),
);
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tution_khata/components/rounded_button.dart';

import '../constant.dart';

void main() {
 runApp(RegisterScreen());
}

class RegisterScreen extends StatefulWidget {
  static String id = "register_screen";

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  File? imageFile;
  bool passwordVisible = false;

  bool _checked = false;

  chooseImage(ImageSource source) async {
    final pickedFile = await ImagePicker().getImage(source: source);
    setState(() {
      imageFile = File(pickedFile!.path);
    });
  }

  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
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
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusColor: Colors.grey,
                                prefixIcon: Icon(Icons.phone),
                                hintText: 'Phone No.',
                                hintStyle: hintText,
                                border: OutlineInputBorder(borderSide: BorderSide.none),
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
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusColor: Colors.grey,
                                prefixIcon: Icon(Icons.phone),
                                hintText: 'Phone No.',
                                hintStyle: hintText,
                                border: OutlineInputBorder(borderSide: BorderSide.none),
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
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusColor: Colors.grey,
                                prefixIcon: Icon(Icons.phone),
                                hintText: 'Phone No.',
                                hintStyle: hintText,
                                border: OutlineInputBorder(borderSide: BorderSide.none),
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
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusColor: Colors.grey,
                                prefixIcon: Icon(Icons.phone),
                                hintText: 'Phone No.',
                                hintStyle: hintText,
                                border: OutlineInputBorder(borderSide: BorderSide.none),
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
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusColor: Colors.grey,
                                prefixIcon: Icon(Icons.phone),
                                hintText: 'Phone No.',
                                hintStyle: hintText,
                                border: OutlineInputBorder(borderSide: BorderSide.none),
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
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusColor: Colors.grey,
                                prefixIcon: Icon(Icons.phone),
                                hintText: 'Phone No.',
                                hintStyle: hintText,
                                border: OutlineInputBorder(borderSide: BorderSide.none),
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
                              obscureText: !passwordVisible,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusColor: Colors.grey,
                                prefixIcon: Icon(Icons.lock),
                                hintText: 'Phone No.',
                                hintStyle: hintText,
                                suffixIcon: IconButton(
                                  color: Colors.grey,
                                  splashRadius: 1,
                                  icon: Icon(passwordVisible
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined),
                                  onPressed: togglePassword,
                                ),
                                border: OutlineInputBorder(borderSide: BorderSide.none),
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
                              obscureText: !passwordVisible,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusColor: Colors.grey,
                                prefixIcon: Icon(Icons.lock),
                                hintText: 'Phone No.',
                                hintStyle: hintText,
                                suffixIcon: IconButton(
                                  color: Colors.grey,
                                  splashRadius: 1,
                                  icon: Icon(passwordVisible
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined),
                                  onPressed: togglePassword,
                                ),
                                border: OutlineInputBorder(borderSide: BorderSide.none),
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

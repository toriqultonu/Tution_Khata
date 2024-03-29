import 'dart:convert';
import 'dart:io';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tution_khata/Helper/DatabaseService.dart';
import 'package:tution_khata/components/buttons/rounded_button.dart';
import 'package:tution_khata/components/textformfield_design.dart';
import 'package:http/http.dart' as http;
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:tution_khata/views/phone_verification_page.dart';


import '../constant.dart';
import '../model/district.dart';


class RegisterScreen extends StatefulWidget {
  static String id = "register_screen";

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  File? imageFile;
  bool passwordVisible1 = false;
  bool passwordVisible2 = false;
  int? selectedRadio;
  String? _img64;

  bool _checked = false;
  String? selectedValue;
  String? fullName, phone, email, gender, password, confirmPass;



  final _formKey = GlobalKey<FormState>();

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

  void togglePassword1() {
    setState(() {
      passwordVisible1 = !passwordVisible1;
    });
  }

  void togglePassword2() {
    setState(() {
      passwordVisible2 = !passwordVisible2;
    });
  }


  List districtList = [];
  String? district;

  getDistrictList() async {
    var response1 = await http.get(
        Uri.parse('https://tution.dcampusweb.com/api/districts'));
    if (response1.statusCode == 200) {
      var data = json.decode(response1.body);

//      print(data);
      setState(() {
        districtList = data;
      });
    }
  }

  // Get State information by API
  List upazillaList = [];
  String? upazilla;


  getUpazillaList() async {
    var response2 = await http.get(Uri.parse('https://tution.dcampusweb.com/api/upazilas-by-district?districtId=$district'));
    if(response2.statusCode == 200){
      var data = json.decode(response2.body);

      setState(() {
        upazillaList = data;
      });
    }
  }


  @override
  void initState() {
    this.getDistrictList();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                          //CustomTextFormField('Full Name', Icon(Icons.person), TextInputType.name),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 45,
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
                            child: TextFormField(
                              textAlignVertical: TextAlignVertical.center,
                              validator: (value) => value!.isEmpty? "Enter correct name" : null,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                isCollapsed: true,
                                prefixIcon: Icon(Icons.person),
                                labelText: 'Full Name',
                                hintStyle: hintText,
                                floatingLabelBehavior: FloatingLabelBehavior.never,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                              onChanged: (value){
                                  fullName = value;
                              },
                            ),
                          ),
                          Spacer(),
                          //CustomTextFormField('Phone No.', Icon(Icons.phone), TextInputType.phone),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 45,
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
                            child: TextFormField(
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.phone,
                              validator: (value) => regexPhone.hasMatch(value!)? null:"Enter correct phone number",
                              decoration: InputDecoration(
                                isCollapsed: true,
                                prefixIcon: Icon(Icons.phone),
                                labelText: 'Phone No.',
                                hintStyle: hintText,
                                floatingLabelBehavior: FloatingLabelBehavior.never,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                              onChanged: (value){
                                phone = value;
                              },
                            ),
                          ),
                          Spacer(),
                          //CustomTextFormField('Email Address', Icon(Icons.email), TextInputType.emailAddress),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 45,
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
                            child: TextFormField(
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.emailAddress,
                              validator: (input) => isValidEmail(input!) ? null : "Check your email",
                              decoration: InputDecoration(
                                isCollapsed: true,
                                prefixIcon: Icon(Icons.email),
                                labelText: 'Email Address',
                                hintStyle: hintText,
                                floatingLabelBehavior: FloatingLabelBehavior.never,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                              onChanged: (value){
                                  email = value;
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

                            child: Expanded(
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton<String>(
                                    value: district,
                                    iconSize: 30,
                                    icon: (null),
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16,
                                    ),
                                    hint: Text('District'),
                                    onChanged: (newValue) {
                                      setState(() {
                                        district = newValue!;
                                        upazilla = null;
                                        getUpazillaList();
                                        print(district);
                                        log('$district');
                                      });
                                    },
                                    items: districtList.map((item) {
                                      return new DropdownMenuItem(
                                        child: new Text(item['district']),
                                        value: item['id'].toString(),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
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
                          child: Expanded(
                            child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton<String>(
                                  value: upazilla,
                                  iconSize: 30,
                                  icon: (null),
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                  ),
                                  hint: Text('Upazilla/Thana'),
                                  onChanged: (newValue) {
                                    setState(() {
                                      upazilla = newValue!;
                                      print(upazilla);
                                    });
                                  },
                                  items: upazillaList.map((item) {
                                    return new DropdownMenuItem(
                                      child: new Text(item['upazila']),
                                      value: item['id'].toString(),
                                    );
                                  }).toList(),
                                ),
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
                                Text('Male', style: TextStyle(color: hintTextColor, fontWeight: FontWeight.w600, fontSize: 14),),
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
                                Text('Female', style: TextStyle(color: hintTextColor, fontWeight: FontWeight.w600, fontSize: 14),),
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
                              obscureText: !passwordVisible1,
                              validator: (value) => regexPassword.hasMatch(value!)? null : "Enter correct password" ,
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
                                  icon: Icon(passwordVisible1
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined),
                                  onPressed: togglePassword1,
                                ),

                              ),
                              onChanged: (value){
                                password = value;
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
                            child: TextFormField(
                              textAlignVertical: TextAlignVertical.center,
                              obscureText: !passwordVisible2,
                              validator: (value) => (value != password) ? "Password didn't match!" : null,
                              decoration: InputDecoration(
                                isCollapsed: true,
                                prefixIcon: Icon(Icons.lock),
                                labelText: 'Confirm Password',
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
                                  icon: Icon(passwordVisible2
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined),
                                  onPressed: togglePassword2,
                                ),

                              ),
                              onChanged: (value){
                                confirmPass = value;
                              },
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
                              onPressed: () async {

                                if(_checked) {
                                  if (_formKey.currentState!.validate()) {
                                    final msg1 = jsonEncode({
                                      "phone": phone,
                                      "email": email,
                                      "name": fullName,
                                      "institutionName": "n",
                                      "picPath": "",
                                      "districtId": district,
                                      "upazilaId": upazilla,
                                      "genderId": selectedRadio,
                                      "password": password
                                    });
                                    final response1 = await http.post(Uri.parse(
                                        'https://tution.dcampusweb.com/api/auth/registration'),
                                        headers: {
                                          'Content-Type': 'application/json',
                                          'Accept': 'application/json',
                                        },
                                        body: msg1);
                                    var jsonData1 = jsonDecode(response1.body);



                                    if (response1.statusCode == 200) {
                                      phoneToVerify = phone;
                                      log("success");
                                      Fluttertoast.showToast(
                                          msg: "Data submitted successfully. Please verify phone number",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.green,
                                          textColor: Colors.white,
                                          fontSize: 16.0
                                      );

                                      await Future.delayed(Duration(seconds: 1));

                                      final msg2 = jsonEncode({
                                        "phone": phone
                                      });
                                      final response2 = await http.post(
                                          Uri.parse(
                                              'https://tution.dcampusweb.com/api/otp/resend'),
                                          headers: {
                                            'Content-Type': 'application/json',
                                            'Accept': 'application/json',
                                          },
                                          body: msg2);


                                      Navigator.pushReplacementNamed(
                                          context, PhoneVerification.id);
                                    }
                                    else {
                                      print("incorrect");
                                      Fluttertoast.showToast(
                                          msg: "Data not submitted. Retry again ",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0
                                      );
                                    }
                                  }
                                  else {
                                    print("incorrect");
                                    Fluttertoast.showToast(
                                        msg: "Incorrect inputs!",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0
                                    );
                                  }
                                }
                                else{
                                  print("incorrect");
                                  Fluttertoast.showToast(
                                      msg: "Please check the terms and conditions",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0
                                  );
                                }

                                log('$fullName $phone $email $district $upazilla $selectedRadio $password $_checked $_img64');
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
        ),
    );
  }
}

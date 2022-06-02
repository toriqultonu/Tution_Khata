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
  String? fullName, phone, email, district, upazilla, gender, password, confirmPass;
  List<String> districts = [];
  late String upzilla;
  String hintDistrict = 'District';
  List districtData = [];
  List upazillaData = [];

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


  getDistricts() async{
    var response1 = await http.get(Uri.parse('https://tution.dcampusweb.com/api/districts'));
    if(response1.statusCode == 200){
      var jsonData = jsonDecode(response1.body);
      // for(int i=0;i<jsonData.length;i++){
      //   districts.add(jsonData[i]["district"].toString());
      // }

      setState(() {
        districtData = jsonData;
      });
    }
    else
      print("Didn't get any response");
  }

  getUpazillas() async{
    var response2 = await http.get(Uri.parse('https://tution.dcampusweb.com/api/upazilas-by-district?districtId=$upazillaid'));
    if(response2.statusCode == 200){
      var jsonData = jsonDecode(response2.body);
      setState(() {
        upazillaData = jsonData;
      });
    }
    else
      print("Didn't get any response");
  }

  @override
  void initState() {
    this.getDistricts();
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

                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.person),
                              ),
                              hint: Text('$hintDistrict'),
                              items: districtData.map((item) {

                                return DropdownMenuItem<String>(
                                  // onTap: (){
                                  //   district = item['district'].toString();
                                  // },
                                  value: item['id'].toString(),
                                  child: new Text(item['district'])
                                );
                              }).toList(),
                              value: upazillaid,
                              onChanged: (newval) {
                                upazillaid = newval!;
                                district = newval;
                                setState(() {

                                });
                                getUpazillas();
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
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.person),
                            ),
                            hint: Text('Upazila/Thana'),
                            items: upazillaData.map((item) {
                              return DropdownMenuItem<String>(
                                onTap: (){
                                  upazilla = item['upazila'].toString();
                                },
                                value: item['id'].toString(),
                                child: new Text(item['upazila'])
                              );
                            }).toList(),
                            value: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                upazilla = value!;
                              });

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
                              onPressed: () async{


                                print('asfda');
                                if(_checked){

                                  if(_formKey.currentState!.validate()){
                                    if (DatabaseService.getRegistered(phone?? "", email?? "", fullName?? "", _img64?? "", district?? "", upazilla?? "", selectedRadio.toString(), password?? "") == true) {
                                      log("success");
                                      Fluttertoast.showToast(
                                          msg: "Data submitted successfully \n Please verify phone number",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.green,
                                          textColor: Colors.white,
                                          fontSize: 16.0
                                      );
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PhoneVerification()));
                                    }
                                    else{
                                      log("failed");
                                      Fluttertoast.showToast(
                                          msg: "Registration incomplete",
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
                                        msg: "Incorrect inputs ",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0
                                    );
                                  }

                                  //DatabaseService.getRegistered(phone?? "", email?? "", fullName?? "", _img64?? "", district?? "", upazilla?? "", selectedRadio.toString(), password?? "");
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
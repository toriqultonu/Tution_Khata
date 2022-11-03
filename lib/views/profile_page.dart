import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tution_khata/components/change_password_alertdialog.dart';
import 'package:tution_khata/components/custom_app_bar.dart';
import 'package:tution_khata/components/custom_info_shower.dart';
import 'package:tution_khata/components/buttons/rounded_button.dart';
import 'package:tution_khata/components/textformfield_design.dart';

import '../constant.dart';


class ProfilePage extends StatefulWidget {
  static String id = "profile_page";

  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  File? imageFile;
  bool passwordVisible = false;
  int? selectedRadio;

  bool _checked = false;


  Future openDialog(context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: ChangePasswordAlert()
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: CustomAppBar(str1: 'Profile' ),
        centerTitle: true,
        elevation: 15,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
                children:[
                  SizedBox(height: 45,),
                  Container(
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.only(bottom: 25),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 0.1,
                            blurRadius: 2,
                            offset: Offset(3, 3))
                      ],
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/component/profiledemo.png"),
                        )
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                    width: MediaQuery.of(context).size.width *0.9,
                    height: 450,
                    //color: boxColor,
                    decoration: CustomBoxDecoration(boxColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomInfoShower(icon: Icon(Icons.ac_unit_rounded, size: 24,), labelText: 'Full Name', mainInfo: '$teacherName'),
                        Spacer(),
                        CustomInfoShower(icon: Icon(Icons.ac_unit_rounded, size: 24,), labelText: 'Full Name', mainInfo: 'Anik'),
                        Spacer(),
                        CustomInfoShower(icon: Icon(Icons.ac_unit_rounded, size: 24,), labelText: 'Full Name', mainInfo: 'Anik'),
                        Spacer(),
                        CustomInfoShower(icon: Icon(Icons.ac_unit_rounded, size: 24,), labelText: 'Full Name', mainInfo: 'Anik'),
                        Spacer(),
                        CustomInfoShower(icon: Icon(Icons.ac_unit_rounded, size: 24,), labelText: 'Full Name', mainInfo: 'Anik'),
                        Spacer(),
                        CustomInfoShower(icon: Icon(Icons.ac_unit_rounded, size: 24,), labelText: 'Full Name', mainInfo: 'Anik'),

                      ],
                    ),

                  ),

                  SizedBox(height: 15,),
                  RoundedButton(color: primaryColor, title: 'Click to change your password', onPressed: (){openDialog(context);}, height: 55, width: 277)
                ]
            ),
          ),

        ),
      ),
    );
  }
}

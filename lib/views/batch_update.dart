import 'dart:developer';

import 'package:day_picker/day_picker.dart';
import 'package:day_picker/model/day_in_week.dart';
import 'package:flutter/material.dart';
import 'package:tution_khata/build_lists/build_unapprovedStudent_list.dart';
import 'package:tution_khata/components/buttons/custom_flat_button.dart';
import 'package:tution_khata/components/buttons/regular_button.dart';
import 'package:tution_khata/components/buttons/rounded_button.dart';
import 'package:tution_khata/views/waiting_list.dart';

import '../Helper/DatabaseService.dart';
import '../build_lists/build_captain_list.dart';
import '../components/custom_app_bar.dart';
import '../constant.dart';

class BatchUpdate extends StatefulWidget {
  static String id = "batch_update";

  @override
  _BatchUpdateState createState() => _BatchUpdateState();
}

class _BatchUpdateState extends State<BatchUpdate> {

  String? selectedValue;
  int? selectedRadio;

  setSelectedRadio(val){
    setState(() {
      selectedRadio = val;
    });
  }

  List<DayInWeek> _days = [
    DayInWeek(
      "Sat",
    ),
    DayInWeek(
      "Sun",
    ),
    DayInWeek(
      "Mon",
    ),
    DayInWeek(
      "Tue",
    ),
    DayInWeek(
      "Wed",
    ),
    DayInWeek(
      "Thu",
    ),
    DayInWeek(
      "Fri",
    ),
  ];

  TimeOfDay? startTime;
  TimeOfDay? endTime;

  Future pickStartTime(BuildContext context) async{
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(context: context, initialTime: startTime ?? initialTime);

    if(newTime == null) return;

    setState(() {
      startTime = newTime;
    });
  }

  Future pickEndTime(BuildContext context) async{
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(context: context, initialTime: startTime ?? initialTime);

    if(newTime == null) return;

    setState(() {
      endTime = newTime;
    });
  }

  getStartTime(){
    if(startTime == null){
      return 'Select Start Time';
    }
    else{
      final hour = startTime?.hour.toString().padLeft(2,'0');
      final minute = startTime?.minute.toString().padLeft(2,'0');
      return 'Start Time: ${startTime?.hour}:${startTime?.minute}';
    }
  }

  getEndTime(){
    if(endTime == null){
      return 'Select End Time';
    }
    else{
      final hour = endTime?.hour.toString().padLeft(2,'0');
      final minute = endTime?.minute.toString().padLeft(2,'0');
      return 'End Time: ${endTime?.hour}:${endTime?.minute}';
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        title: CustomAppBar(str1: 'Update Batch'),
        centerTitle: true,
        elevation: 15,
      ),
      body: Center(
        child: Container(
          child: ListView(
            children: [
              SizedBox(height: 55,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width*1.2,
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(15),
                decoration: CustomBoxDecoration(boxColor),
                child: Column(
                  children: [
                    Spacer(),
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
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          isCollapsed: true,
                          prefixIcon: Icon(Icons.person),
                          labelText: 'Batch Name',
                          hintStyle: hintText,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        onChanged: (value){

                        },
                      ),
                    ),
                    Spacer(),
                    Text('Select Days:'),
                    SelectWeekDays(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      days: _days,
                      boxDecoration: CustomBoxDecoration(primaryColor),
                      onSelect: (values) {
                        log('$values');
                      },
                    ),
                    Spacer(),

                    GestureDetector(
                      onTap: (){
                        pickStartTime(context);
                      },
                      child: Container(
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
                        child: Center(child: Text(getStartTime())),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: (){
                        pickEndTime(context);
                      },
                      child: Container(
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
                        child: Center(child: Text(getEndTime())),
                      ),
                    ),
                    Spacer(),
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
                        decoration: InputDecoration(
                          isCollapsed: true,
                          prefixIcon: Icon(Icons.phone),
                          labelText: 'Fee (BDT)',
                          hintStyle: hintText,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        onChanged: (value){

                        },
                      ),
                    ),
                    Spacer(),
                    RoundedButton(color: primaryColor, title: 'Update Batch', onPressed: (){}, height: 30, width: 15),

                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

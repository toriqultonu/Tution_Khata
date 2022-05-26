import 'dart:developer';

import 'package:flutter/material.dart';

import '../constant.dart';
import '../model/attendance.dart';

class AttendanceList extends StatefulWidget {
  final snapshot;

  const AttendanceList({Key? key, this.snapshot}) : super(key: key);


  @override
  _AttendanceListState createState() => _AttendanceListState();
}

class _AttendanceListState extends State<AttendanceList> {

  List<Attendance> selectedStudents = [];
  List<Attendance> students = [];

  @override
  void initState() {
    for(int i =0;i<widget.snapshot.data.length;i++){
      students.add(Attendance(widget.snapshot.data[i].name, widget.snapshot.data[i].phone, widget.snapshot.data[i].id, false));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: [
          ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: students.length,
              itemBuilder: (context, index) {
                return AttendanceItem(
                  students[index].name,
                  students[index].phone,
                  students[index].id,
                  students[index].isSelected,
                  index,
                );
              }
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 10,
            ),
            child: SizedBox(
              width: double.infinity,
              child: RaisedButton(
                color: primaryColor,
                child: Text(
                  "Submit (${selectedStudents.length})",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  print("Delete List Lenght: ${selectedStudents.length}");
                  for(var select in selectedStudents){
                    log('${select.name}');
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );

  }


  Widget AttendanceItem(
      String name, String phone, var id, bool isSelected, int index) {
    return ListTile(
      // leading: CircleAvatar(
      //   backgroundColor: Colors.green[700],
      //   child: Icon(
      //     Icons.person_outline_outlined,
      //     color: Colors.white,
      //   ),
      // ),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(phone),
      trailing: isSelected
          ? Icon(
        Icons.check_circle,
        color: primaryColor,
      )
          : Icon(
        Icons.check_circle_outline,
        color: Colors.grey,
      ),
      onTap: () {
        setState(() {
          students[index].isSelected = !students[index].isSelected;
          if (students[index].isSelected == true) {
            selectedStudents.add(Attendance(name, phone, id,true));
          } else if (students[index].isSelected == false) {
            selectedStudents
                .removeWhere((element) => element.id == students[index].id);
          }
        });


      },
    );
  }
}

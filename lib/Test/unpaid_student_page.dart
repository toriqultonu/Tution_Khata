import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tution_khata/Helper/DatabaseService.dart';
import 'package:tution_khata/Test/studet_list_tile_widget.dart';
import 'package:tution_khata/Test/unpaid_student.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';
import 'student_provider.dart';

class UnpaidStudentPage extends StatefulWidget {

  final bool isMultiSelection;


  UnpaidStudentPage({required this.isMultiSelection});

  @override
  State<UnpaidStudentPage> createState() => _UnpaidStudentPageState();
}

class _UnpaidStudentPageState extends State<UnpaidStudentPage> {

  List<UnpaidStudent> selectedStudents = [];

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<UnpaidStudentProvider>(context);
    final allStudents = provider.students;

    return Scaffold(
      appBar: AppBar(
        title: Text('Select Student'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: allStudents.map((student){

                final isSelected = selectedStudents.contains(student);

                return StudentListTileWidget(
                  student: student,
                  isSelected: isSelected,
                  onSelectStudent: (student){

                  }
                );
              }).toList(),
            ),
          ),
          Container(
            child: widget.isMultiSelection? Text("Selected ${selectedStudents.length}") : Text("null"),
          )
        ],
      ),
    );
  }

  void selectStudent(UnpaidStudent student){
      if(widget.isMultiSelection){
        final isSelected = selectedStudents.contains(student);
        setState(() {
          isSelected ? selectedStudents.remove(student):selectedStudents.add(student);
        });
      }
  }
}

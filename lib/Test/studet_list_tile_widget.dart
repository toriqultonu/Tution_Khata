import 'package:flutter/material.dart';
import 'package:tution_khata/Test/unpaid_student.dart';

class StudentListTileWidget extends StatelessWidget {

  final UnpaidStudent student;
  final bool isSelected;
  final ValueChanged<UnpaidStudent> onSelectStudent;


  StudentListTileWidget({required this.student, required this.isSelected, required this.onSelectStudent});

  @override
  Widget build(BuildContext context) {

    final selectedColor = Theme.of(context).primaryColor;
    final stl = isSelected ? TextStyle(fontSize: 18, color: selectedColor, fontWeight: FontWeight.bold):TextStyle(fontSize: 18);

    return ListTile(
      title: Text(student.name, style: stl,),
      trailing: isSelected ? Icon(Icons.check, color: selectedColor, size: 26,) : null,
    );
  }
}

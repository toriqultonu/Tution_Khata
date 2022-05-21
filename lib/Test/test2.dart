import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'student_provider.dart';

class UnpaidStudentPage extends StatefulWidget {


  @override
  State<UnpaidStudentPage> createState() => _UnpaidStudentPageState();
}

class _UnpaidStudentPageState extends State<UnpaidStudentPage> {
  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<UnpaidStudentProvider>(context);
    final allStudents = provider.students;

    return Scaffold(
      appBar: AppBar(
        title: Text('Select Student'),
      ),
      body: ListView(
        children: [

        ],
      ),
    );
  }
}

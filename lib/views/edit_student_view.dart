import 'package:flutter/material.dart';
import 'package:tution_khata/components/custom_app_bar.dart';


import '../components/text_dialog_widget.dart';
import '../constant.dart';

// void main() {
//  runApp(EditStudent());
// }

Future<T?> showTextDialog<T>(

  BuildContext context, {
    required String title,
    required String value,
}) => showDialog<T>(
    context: context,
    builder: (context) => TextDialogWidget(
      title: title,
      value: value,
    ),
);

class EditStudent extends StatefulWidget {


  static String id = "edit_student";

  final studentId;
  final name;
  final phone;
  final approvalStatus;
  final isActive;

  const EditStudent({this.studentId, this.name, this.phone, this.approvalStatus, this.isActive, });

  @override
  _EditStudentState createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {

  String? name;
  String? phone;

  @override
  void initState() {
    name = widget.name;
    phone = widget.phone;
  }


  Future editName(String user) async{
    final firstName = await showTextDialog(context, title: 'Change Name', value: user);

    setState(() {
      name = firstName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: primaryColor,
          title: CustomAppBar(str1: 'Edit Student'),
          centerTitle: true,
          elevation: 15,
        ),

        body: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Column(
                children: [
                  SizedBox(height: 40,),

                  Container(
                    width: 70,
                    height: 70,
                    margin: EdgeInsets.only(bottom: 25),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/component/editstudent.png"),
                        )
                    ),
                  ),
                  SizedBox(height: 40,),

                  Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width * 0.9,
                    //decoration: CustomBoxDecoration(Colors.white),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black45),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 34,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Name', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
                            SizedBox(height: 10,),
                            Text(name!, style: TextStyle( fontSize: 18),),
                            SizedBox(height: 3,),
                          ],
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: (){
                            editName(name!);
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(Icons.edit),
                          ),
                        )
                      ],
                    ),

                  ),

                  SizedBox(height: 40,),

                  Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black45),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 34,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Mobile Number', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
                            SizedBox(height: 10,),
                            Text(phone!, style: TextStyle( fontSize: 18),),
                            SizedBox(height: 3,),
                          ],
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, EditStudent.id);
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(Icons.edit),
                          ),
                        )
                      ],
                    ),

                  ),

                  SizedBox(height: 40,),

                  Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black45),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 34,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Fee Amount', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
                            SizedBox(height: 10,),
                            Text('500', style: TextStyle( fontSize: 18),),
                            SizedBox(height: 3,),
                          ],
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, EditStudent.id);
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(Icons.edit),
                          ),
                        )
                      ],
                    ),

                  ),
                ],
              ),
            ),
          ),
        ),
      );

  }
}

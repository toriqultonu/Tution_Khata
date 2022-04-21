import 'package:flutter/material.dart';
import 'package:tution_khata/components/buttons/rounded_button.dart';
import 'package:tution_khata/components/custom_app_bar.dart';
import '../Helper/edit_student_data.dart';
import '../constant.dart';

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
  String? fee = '500';
  
  @override
  void initState() {
    name = widget.name;
    phone = widget.phone;
  }
  
  Future editName(String oldName) async{
    final newName = await showTextDialog(context, title: 'Change Name', value: oldName);

    setState(() {
      if(newName == null)
        name = oldName;
      else
        name = newName;
    });
  }

  Future editPhone(String oldPhone) async{
    final newPhone = await showTextDialog(context, title: 'Change Phone Number', value: oldPhone);

    setState(() {
      if(newPhone == null)
        phone = oldPhone;
      else
        phone = newPhone;
    });
  }

  Future editFee(String oldFee) async{
    final newFee = await showTextDialog(context, title: 'Change Fee', value: oldFee);

    setState(() {
      if(newFee == null)
        fee = oldFee;
      else
        fee = newFee;
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
                            editPhone(phone!);
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

                  RoundedButton(color: primaryColor, title: "Update", onPressed: (){
                          updateStudentInfo(widget.studentId.toString(), name!, phone!);
                  }, height: 23, width: 32,),

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
                            Text(fee!, style: TextStyle( fontSize: 18),),
                            SizedBox(height: 3,),
                          ],
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: (){
                            editFee(fee!);
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
                  RoundedButton(color: primaryColor, title: "Update", onPressed: (){}, height: 23, width: 32,),
                ],
              ),
            ),
          ),
        ),
      );

  }
}

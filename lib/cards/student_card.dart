import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tution_khata/constant.dart';
import 'package:tution_khata/views/batch_details.dart';
import 'package:tution_khata/views/edit_student_view.dart';
import 'package:tution_khata/views/personal_sms_view.dart';

class StudentCard extends StatefulWidget {
  final id;
  final name;
  final phone;
  final approvalStatus;
  final isActive;
  StudentCard({ required this.id,required this.name, required this.phone,required this.isActive, required this.approvalStatus});

  @override
  State<StudentCard> createState() => _StudentCardState();
}

class _StudentCardState extends State<StudentCard> with SingleTickerProviderStateMixin{

  AnimationController? controller;
  Animation<Offset>? offset;

  double padding = 30;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 0));

    offset = Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(0.0, 0.56)).animate(controller!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 0),
      alignment: Alignment.center,
      child: Stack(
        children: [
          Align(
          alignment: Alignment.center,
          child: SlideTransition(
            position: offset!,
            child: Padding(
              padding: EdgeInsets.only(bottom: padding),
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.9,
                //decoration: CustomBoxDecoration(primaryColor),
                child: Row(
                  children: [
                    Spacer(),
                    GestureDetector(
                      onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalSMS(
                            studentId: widget.id,
                            studentName: widget.name,
                            studentPhone: widget.phone,
                          )));
                      },
                      child: Container(
                        height: 30,
                        width: 70,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(25)
                        ),
                        child: Icon(Icons.mail_outline),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: (){

                      },
                      child: Container(
                        height: 30,
                        width: 70,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(25)
                        ),
                        child: Icon(Icons.phone_outlined),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: (){

                      },
                      child: Container(
                        height: 30,
                        width: 70,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(25)
                        ),
                        child: Icon(Icons.attach_money_outlined),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => EditStudent(
                          studentId: widget.id,
                          name: widget.name,
                          phone: widget.phone,
                          isActive: widget.isActive,
                          approvalStatus: widget.approvalStatus

                        )));
                      },
                      child: Container(
                        height: 30,
                        width: 70,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(25)
                        ),
                        child: Icon(Icons.remove_red_eye_outlined),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: CustomBoxDecoration(Colors.white),
            child: Row(
              children: [
                SizedBox(width: 34,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.name, style: TextStyle(color: primaryColor, fontSize: 18, fontWeight: FontWeight.w500),),
                    SizedBox(height: 5,),
                    Text(widget.phone, style: TextStyle( fontSize: 14),),
                    SizedBox(height: 3,),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: (){
                    //Navigator.pushNamed(context, EditStudent.id);
                    switch (controller!.status) {
                      case AnimationStatus.completed:
                        controller!.reverse();
                        setState(() {
                          padding = 30;
                        });

                        break;
                      case AnimationStatus.dismissed:
                        controller!.forward();
                        setState(() {
                          padding = 70;
                        });

                        break;
                      default:
                    }

                  },
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(Icons.keyboard_arrow_down),
                  ),
                )
              ],
            ),

          ),

        ],
      ),
    );
  }
}

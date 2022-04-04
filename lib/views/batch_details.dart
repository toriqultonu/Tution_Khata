import 'package:flutter/material.dart';
import 'package:tution_khata/Helper/DatabaseService.dart';
import 'package:tution_khata/build_lists/build_student_list.dart';
import 'package:tution_khata/components/custom_app_bar.dart';
import 'package:tution_khata/build_lists/build_batch_list.dart';
import 'package:tution_khata/constant.dart';

// void main() {
//   runApp(BatchDetails());
// }


class BatchDetails extends StatefulWidget {
  static String id = "batch_details_screen";
  const BatchDetails({Key? key}) : super(key: key);

  @override
  _BatchDetailsState createState() => _BatchDetailsState();
}

class _BatchDetailsState extends State<BatchDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: primaryColor,
          title: CustomAppBar(str1: 'Batch Details'),
          centerTitle: true,
          elevation: 15,
        ),
        body: Container(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 17, vertical: 17),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 29),
                    height: 110,
                    decoration: CustomBoxDecoration(boxColor),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          padding: EdgeInsets.only(top: 8, right: 14),
                          child: Text('Batch Code: 010101', style: TextStyle(fontWeight: FontWeight.w600,),),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text('Batch Name: Math 1', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w600, fontSize: 17),),
                        ),
                        SizedBox(height: 5,),
                        Container(alignment: Alignment.centerLeft,child: Text('Day: '),),
                        SizedBox(height: 5,),
                        Container(alignment: Alignment.centerLeft,child: Text('Time: '),),
                        GestureDetector(
                          onTap: (){
                            print('click to edit');
                          },
                          child: Container(
                            padding: EdgeInsets.only(right:14 ),
                            alignment: Alignment.bottomRight,
                            child: Text('Click to edit', style: TextStyle(color: Colors.redAccent),),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    padding: EdgeInsets.only(left: 29, top: 11),
                    height: 100,
                    decoration: CustomBoxDecoration(primaryColor),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 55.0,
                              height: 55.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage("assets/component/profiledemo.png"),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(width: 16,),
                            Container(
                              height: 60,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text('Name: Mojura Moula', style: TextStyle(fontFamily: 'Nunito Sans', fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white),),
                                  ),
                                  Spacer(),
                                  Container(
                                    child: Text('Role: Captain', style: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.w400, fontSize: 14, color: Colors.white),),
                                  ),
                                  Spacer(),
                                  Container(
                                    child: Text('Phone no: 01699999999', style: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.w400, fontSize: 14, color: Colors.white),),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: (){
                            print('click to edit');
                          },
                          child: Container(
                            padding: EdgeInsets.only(right:14, bottom: 5),
                            alignment: Alignment.bottomRight,
                            child: Text('Click to edit', style: TextStyle(color: Colors.redAccent),),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 10, left: 14, right: 14),
                      decoration: CustomBoxDecoration(boxColor),
                      child: Column(
                        children: [
                          Container(
                            child: Text('Student List', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w600, fontSize: 20),),
                          ),
                          Container(child: Text('click on the student to view more options'),),
                          SizedBox(height: 9,),
                          Expanded(
                            child: ListView(
                              children: [
                                FutureBuilder(
                                    future: DatabaseService.getCaptainList(token),
                                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                                      switch (snapshot.connectionState) {
                                        case ConnectionState.waiting:
                                          return Center(
                                              child: Container(
                                                margin: EdgeInsets.only(top: 120),
                                                width: 100,
                                                height: 100,
                                                child: CircularProgressIndicator(),
                                              ));
                                        default:
                                          if (snapshot.hasError) {
                                            return Center(
                                                child: Container(
                                                  child: Text(
                                                      'Some error occurred! Contact our support team'),
                                                ));
                                          } else {
                                            return buildStudentList(snapshot);
                                          }
                                      }
                                    })
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,)
                ],
              ),
            ),
          ),
        ),
    );
  }
}

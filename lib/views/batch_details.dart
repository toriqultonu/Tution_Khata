import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:tution_khata/components/custom_app_bar.dart';
import 'package:tution_khata/constant.dart';

// void main() {
//   runApp(BatchDetails());
// }


class BatchDetails extends StatefulWidget {
  const BatchDetails({Key? key}) : super(key: key);

  @override
  _BatchDetailsState createState() => _BatchDetailsState();
}

class _BatchDetailsState extends State<BatchDetails> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: primaryColor,
          title: CustomAppBar(str1: 'Batch Details', str2: '',),
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
                      padding: EdgeInsets.only(top: 10),
                      decoration: CustomBoxDecoration(boxColor),
                      child: Column(
                        children: [
                          Container(
                            child: Text('Student List', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w600, fontSize: 17),),
                          )
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
      ),
    );
  }
}

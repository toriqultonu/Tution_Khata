import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tution_khata/components/custom_app_bar.dart';
import 'package:tution_khata/components/buttons/rounded_button.dart';
import 'package:tution_khata/views/unpaid_students_list.dart';
import 'package:tution_khata/views/unpaidmonth_list_of_student.dart';
import '../Helper/DatabaseService.dart';
import '../constant.dart';
import '../model/unpaidmonth_for_list.dart';
import 'attendance_list.dart';

class BatchWiseCollection extends StatefulWidget {

  static String id = "batch_wise_collection";

  final batchId;
  final year;
  final monthId;

  const BatchWiseCollection({Key? key, this.batchId, this.year, this.monthId}) : super(key: key);

  @override
  _BatchWiseCollectionState createState() => _BatchWiseCollectionState();
}

class _BatchWiseCollectionState extends State<BatchWiseCollection> {


  List<UnpaidMonthForList> selectedContacts = [];
  List<UnpaidMonthForList> contacts = [];
  int totalFee = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: CustomAppBar(str1: 'Batch wise collection' ),
        centerTitle: true,
        elevation: 15,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [

              SizedBox(height: 20,),
              Expanded(
                child: ListView(
                  children: [
                    FutureBuilder(
                        future: DatabaseService.getUnpaidStudentsOfBatch(token, widget.batchId, widget.year, widget.monthId),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return Center(
                                  child: Container(
                                    margin: EdgeInsets.only(top: 120),
                                    width: 150,
                                    height: 150,
                                    child: LoadingAnimationWidget.dotsTriangle(
                                      color: primaryColor,
                                      size: 100,
                                    ),
                                  ));
                            default:
                              if (snapshot.hasError) {
                                return Center(
                                    child: Container(
                                      child: Text(
                                          'Some error occurred! Contact our support team'),
                                    ));
                              } else {
                                return UnpaidStudentList(snapshot: snapshot, batchId: widget.batchId, monthId: widget.monthId, yearId: widget.year);
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

    );
  }

  unpaidMonthList(AsyncSnapshot snapshot){

    for(int i =0;i<snapshot.data.length;i++){
      contacts.add(UnpaidMonthForList(snapshot.data[i].id, snapshot.data[i].monthId, snapshot.data[i].month, snapshot.data[i].yearId, snapshot.data[i].fee, snapshot.data[i].paidAmount, snapshot.data[i].waiverAmount, false));
    }

    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 10,
            ),
            child: Column(
              children: [
                Text('Total              $totalFee', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      color: Colors.redAccent,
                      child: Text(
                        "Go Back",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () {
                        print("Delete List Lenght: ${selectedContacts.length}");
                        for(var select in selectedContacts){
                          log('${select.month}, ${select.yearId}');
                        }
                      },
                    ),
                    SizedBox(width: 30,),
                    RaisedButton(
                      color: Colors.greenAccent,
                      child: Text(
                        "Take",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () {
                        print("Delete List Lenght: ${selectedContacts.length}");
                        for(var select in selectedContacts){
                          log('${select.month}, ${select.yearId}');
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.black,
            thickness: 2,
          ),
          ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ContactItem(
                  contacts[index].id,
                  contacts[index].monthId,
                  contacts[index].month,
                  contacts[index].yearId,
                  contacts[index].fee,
                  contacts[index].paidAmount,
                  contacts[index].waiverAmount,
                  contacts[index].isSelected,
                  index,
                );
              }
          ),

        ],
      ),
    );
  }


  Widget ContactItem(
      var id, var monthId, String month, String yearId, String fee, String paidAmount, String waiverAmount, bool isSelected, int index) {
    return ListTile(
      // leading: CircleAvatar(
      //   backgroundColor: Colors.green[700],
      //   child: Icon(
      //     Icons.person_outline_outlined,
      //     color: Colors.white,
      //   ),
      // ),
      title: Text(
        '$id                $yearId',
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),

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
          contacts[index].isSelected = !contacts[index].isSelected;
          if (contacts[index].isSelected == true) {
            totalFee += int.parse(fee);
            selectedContacts.add(UnpaidMonthForList(id, monthId, month, yearId, fee, paidAmount, waiverAmount, true));
          } else if (contacts[index].isSelected == false) {
            totalFee -= int.parse(fee);
            selectedContacts
                .removeWhere((element) => element.id == contacts[index].id);
          }
        });


      },
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tution_khata/model/unpaidmonth_for_list.dart';

import '../Helper/DatabaseService.dart';
import '../constant.dart';
import '../model/attendance.dart';

class UnpaidMonthList extends StatefulWidget {
  final snapshot;

  const UnpaidMonthList({Key? key, this.snapshot}) : super(key: key);


  @override
  _UnpaidMonthListState createState() => _UnpaidMonthListState();
}

class _UnpaidMonthListState extends State<UnpaidMonthList> {

  List<UnpaidMonthForList> selectedContacts = [];
  List<UnpaidMonthForList> contacts = [];
  int totalFee = 0;

  @override
  void initState() {

    var snap = DatabaseService.unPaidMonthByStudent(token, 1);

    for(int i =0;i<widget.snapshot.data.length;i++){
      contacts.add(UnpaidMonthForList(widget.snapshot.data[i].id, widget.snapshot.data[i].monthId, widget.snapshot.data[i].month, widget.snapshot.data[i].yearId, widget.snapshot.data[i].fee, widget.snapshot.data[i].paidAmount, widget.snapshot.data[i].waiverAmount, false));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

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
        '$month, $yearId                    $fee',
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

//
// import 'dart:convert';
// import 'dart:developer';
//
//
// import 'package:flutter/material.dart';
// import 'package:snippet_coder_utils/FormHelper.dart';
// import 'package:http/http.dart' as http;
//
// void main() async {
//
//   final body1 = jsonEncode({
//     "batchId": '1000041',
//     "schedule": [
//       {
//         "dayId": dayToId[dateVal[0]],
//         "startingTime": start,
//         "endingTime": end
//       },
//       {
//         "dayId": dayToId[dateVal[1]],
//         "startingTime": start,
//         "endingTime": end
//       },
//       {
//         "dayId": dayToId[dateVal[2]],
//         "startingTime": start,
//         "endingTime": end
//       },
//       {
//         "dayId": dayToId[dateVal[3]],
//         "startingTime": start,
//         "endingTime": end
//       },
//       {
//         "dayId": dayToId[dateVal[4]],
//         "startingTime": start,
//         "endingTime": end
//       },
//       {
//         "dayId": dayToId[dateVal[5]],
//         "startingTime": start,
//         "endingTime": end
//       },
//       {
//         "dayId": dayToId[dateVal[6]],
//         "startingTime": start,
//         "endingTime": end
//       },
//     ]
//   });
//
//   final response1 = await http.post(Uri.parse(
//       'https://tution.dcampusweb.com/api/batch/update/schedule?token='),
//       headers: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Authorization': 'Bearer $token',
//       },
//       body: body1);
//
//   log('${schedules.toString()}');
//
//   final body2 = jsonEncode({
//     "batchId": widget.batchId,
//     "batchName": batchName
//   });
// }
//
// // class MyApp extends StatelessWidget {
// //   const MyApp({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //
// //       title: 'Dependent Dropdown',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: MyHomePage(title: 'Flutter Demo Home Page'),
// //     );
// //
// //   }
// // }
// //
// //
// // class MyHomePage extends StatefulWidget {
// //
// //   final String title;
// //   const MyHomePage({Key? key, required this.title}) : super(key: key);
// //
// //   @override
// //   State<MyHomePage> createState() => _MyHomePageState();
// // }
// //
// // class _MyHomePageState extends State<MyHomePage> {
// //
// //   List<dynamic> countries = [];
// //   List<dynamic> statesMasters =[];
// //   List<dynamic> state = [];
// //   String countryId = '1';
// //   String? stateId;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     this.countries.add({"id":1, "label":"Bangladesh"});
// //     this.countries.add({"id":2, "label":"USA"});
// //
// //     this.statesMasters = [
// //       {"Id":1, "name":"bogura", "parentId":1},
// //       {"Id":2, "name":"rajshahi", "parentId":1},
// //       {"Id":3, "name":"khulna", "parentId":1},
// //       {"Id":4, "name":"dhaka", "parentId":1},
// //       {"Id":5, "name":"texus", "parentId":2},
// //       {"Id":6, "name":"washington", "parentId":2},
// //       {"Id":7, "name":"rweergton", "parentId":2},
// //       {"Id":8, "name":"231rngton", "parentId":2},
// //     ];
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: Scaffold(
// //         appBar: AppBar(
// //           title: Text("Flutter dependent dropdown"),
// //           backgroundColor: Colors.redAccent,
// //         ),
// //
// //         body: Column(
// //           children: [
// //             FormHelper.dropDownWidget(
// //                 context,
// //                 "Select Country",
// //                 this.countryId,
// //                 this.countries,
// //                 (onChangedValue){setState(() {
// //                       this.state = [];
// //                 });
// //                   this.countryId = onChangedValue;
// //                   this.state = this.statesMasters.where((element) => element["parentId"].toString() == onChangedValue.toString()).toList();
// //                   this.stateId = null;
// //
// //                 },
// //                 (onvalidate){
// //                   if(onvalidate == null){
// //                     return "please select country";
// //                   }
// //
// //                   return null;
// //                 },
// //               borderColor: Theme.of(context).primaryColor,
// //               borderFocusColor: Theme.of(context).primaryColor,
// //               borderRadius: 10,
// //               optionValue: "id",
// //               optionLabel: "label"
// //             ),
// //
// //             FormHelper.dropDownWidgetWithLabel(context, "state", "select state", this.stateId, this.state,
// //                 (onChangedValue){
// //                   this.stateId = onChangedValue;
// //                 },
// //                 ()=> null,
// //
// //                 borderColor: Theme.of(context).primaryColor,
// //                 borderFocusColor: Theme.of(context).primaryColor,
// //                 borderRadius: 10,
// //                 optionValue: "Id",
// //                 optionLabel: "name"
// //             )
// //           ],
// //         ),
// //
// //       ),
// //     );
// //   }
// // }

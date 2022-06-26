import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    getDistrictList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic DropDownList REST API'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[

          //======================================================== State

          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 5),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                        value: district,
                        iconSize: 30,
                        icon: (null),
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                        hint: Text('Select State'),
                        onChanged: (newValue) {
                          setState(() {
                            district = newValue!;
                            upazilla = null;
                            getUpazillaList();
                            print(district);
                            log('$district');
                          });
                        },
                        items: districtList.map((item) {
                          return new DropdownMenuItem(
                            child: new Text(item['district']),
                            value: item['id'].toString(),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),

          //======================================================== City

          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 5),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                        value: upazilla,
                        iconSize: 30,
                        icon: (null),
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                        hint: Text('Select City'),
                        onChanged: (newValue) {
                          setState(() {
                            upazilla = newValue!;
                            print(upazilla);
                          });
                        },
                        items: upazillaList.map((item) {
                          return new DropdownMenuItem(
                            child: new Text(item['upazila']),
                            value: item['id'].toString(),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //=============================================================================== Api Calling here

//CALLING STATE API HERE
// Get State information by API
   List districtList = [];
  String? district;

  getDistrictList() async {
    var response1 = await http.get(
        Uri.parse('https://tution.dcampusweb.com/api/districts'));
    if (response1.statusCode == 200) {
      var data = json.decode(response1.body);

//      print(data);
      setState(() {
        districtList = data;
      });
    }
  }

  // Get State information by API
   List upazillaList = [];
   String? upazilla;


  getUpazillaList() async {
    var response2 = await http.get(Uri.parse('https://tution.dcampusweb.com/api/upazilas-by-district?districtId=$district'));
    if(response2.statusCode == 200){
      var data = json.decode(response2.body);

      setState(() {
        upazillaList = data;
      });
    }
  }
}
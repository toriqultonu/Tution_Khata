
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dependent DropDown',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Dependent DropDown'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List districtData = [];
  List upazillaData = [];


  String _selectedCountry="India";
  var country={'India':'IN','Pakistan':'PAK','Nepal':'NP','Bangladesh':'BD'};

  List _countries=[];
  CountryDependentDropDown(){


    country.forEach((key, value) {
      _countries.add(key);
    });

  }

  String _selectedState="";
  var state={'Jharkhand':'IN','Panjab':'IN','Baluchistan':'PAK','Dhaka':'BD','Janakpur':'NP'};

  List _states=[];
  StateDependentDropDown(countryShortName){
    state.forEach((key, value) {
      if(countryShortName==value){
        _states.add(key);
      }

    });
    _selectedState= _states[0];
  }

  String _selectedCity="";
  var city={'Ranchi':'Jharkhand','Tata':'Jharkhand','Quetta':'Baluchistan','Ludhiana':'Panjab','Amritsar':'Panjab'};

  List _cities=[];
  CityDependentDropDown(stateShortName){
    city.forEach((key, value) {
      if(stateShortName==value){
        _cities.add(key);
      }

    });
    _selectedCity= _cities[0];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CountryDependentDropDown();
  }
  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin:EdgeInsets.all(15),

        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 23,),
            Align(
              alignment: Alignment.centerLeft,
              child:Text("Country",  style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18),),
            ),
            Container(
              width: 400,
              child: DropdownButton(
                value: _selectedCountry,
                onChanged: (newValue){
                  setState(() {
                    _cities=[];
                    _states=[];
                    StateDependentDropDown(country[newValue]);
                    _selectedCountry="$newValue";
                  });

                },
                items:_countries.map((country){
                  return DropdownMenuItem(
                    child: new Text(country),
                    value:country,
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 23,),

            Align(
                alignment: Alignment.centerLeft,
                child:Text("State", style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18),)
            ),
            Container(
              width: 400,
              child: DropdownButton(
                value: _selectedState,
                onChanged: (newValue){
                  print(newValue);
                  setState(() {
                    print(newValue);
                    _cities=[];
                    CityDependentDropDown(newValue);

                    _selectedState="$newValue";
                  });

                },
                items:_states.map((state){
                  return DropdownMenuItem(
                    child: new Text(state),
                    value:state,
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 23,),

            Align(
                alignment: Alignment.centerLeft,
                child:Text("City", style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18),)
            ),
            Container(
              width: 400,
              child: DropdownButton(
                value: _selectedCity,
                onChanged: (newValue){
                  setState(() {
                    _selectedCity="$newValue";
                  });

                },
                items:_cities.map((city){
                  return DropdownMenuItem(
                    child: new Text(city),
                    value:city,
                  );
                }).toList(),
              ),
            )


          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
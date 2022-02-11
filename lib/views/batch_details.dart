import 'package:flutter/material.dart';
import 'package:tution_khata/components/custom_app_bar.dart';
import 'package:tution_khata/constant.dart';

void main() {
  runApp(BatchDetails());
}


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
          elevation: 13,
        ),
        body: Container(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 17, vertical: 17),
              child: Column(
                children: [
                  Container(
                    height: 88,
                    width: MediaQuery.of(context).size.width,

                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tution_khata/components/buttons/rounded_button.dart';
import 'package:tution_khata/components/custom_app_bar.dart';
import '../Helper/change_Info.dart';
import '../constant.dart';

class EditCaptain extends StatefulWidget {


  static String id = "edit_captain";

  final batchId;
  final name;
  final phone;


  const EditCaptain({this.batchId, this.name, this.phone});

  @override
  _EditCaptainState createState() => _EditCaptainState();
}

class _EditCaptainState extends State<EditCaptain> {

  String? name;
  String? phone,password;
  bool passwordVisible = false;

  @override
  void initState() {
    name = widget.name;
    phone = widget.phone;
  }

  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
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
                  updateCaptainInfo(widget.batchId.toString(), name!, phone!);
                }, height: 23, width: 32,),

                SizedBox(height: 40,),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black45),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    obscureText: !passwordVisible,
                    decoration: InputDecoration(
                      isCollapsed: true,
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'Password',
                      hintStyle: hintText,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      suffixIcon: IconButton(
                        color: Colors.grey,
                        splashRadius: 1,
                        icon: Icon(passwordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                        onPressed: togglePassword,
                      ),

                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black45),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    obscureText: !passwordVisible,
                    decoration: InputDecoration(
                      isCollapsed: true,
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'Confirm Password',
                      hintStyle: hintText,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      suffixIcon: IconButton(
                        color: Colors.grey,
                        splashRadius: 1,
                        icon: Icon(passwordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                        onPressed: togglePassword,
                      ),

                    ),
                    onChanged: (value){
                      password = value;
                    },
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

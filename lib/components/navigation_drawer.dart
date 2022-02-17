import 'package:flutter/material.dart';
import 'package:tution_khata/constant.dart';

class NavigationDrawer extends StatefulWidget {


  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Material(
          color: Colors.white,
          child: ListView(

              children: [
                appHeader(context: context),

                SizedBox(height: 10,),
                buildMenuItem(text: "My Profile", icon: Icons.home_outlined, context: context, ID: 'profile_page'),
                Divider(color: Colors.grey, thickness: 1,),
                buildMenuItem(text: "About Us", icon: Icons.add, context: context, ID: 'about_us'),
                Divider(color: Colors.grey, thickness: 1,),
                buildMenuItem(text: "Contact Us", icon: Icons.add, context: context, ID: 'contact_us'),
                Divider(color: Colors.grey, thickness: 1,),
                buildMenuItem(text: "FAQ", icon: Icons.add, context: context, ID: 'stack'),
                Divider(color: Colors.grey, thickness: 1,),
                buildMenuItem(text: "Video Tutorials", icon: Icons.add, context: context, ID: 'queue'),
                Divider(color: Colors.grey, thickness: 1,),
                buildMenuItem(text: "Log Out", icon: Icons.add, context: context, ID: 'tree'),

              ]
          ),
        ),
      ),
    );
  }
}


Widget buildMenuItem({required String text, required IconData icon, context, required String ID}){

  return ListTile(
    hoverColor: Colors.white,
    leading: Icon(icon, color: Colors.black54, size: 28,),
    title: Text(text,style: TextStyle(color: Colors.black54, fontSize: 17),),
    onTap: (){
      // Navigator.pop(context);
      // Navigator.pop(context);
      Navigator.pushNamed(context, ID);
      print('$text + $ID');
    },
  );
}

Widget textButton({required String text, required String ID, context}){

  return GestureDetector(
    onTap: (){
      Navigator.pushNamed(context, ID);
    },
    child: Container(
        padding: EdgeInsets.only(left: 40, bottom: 15, top: 10),
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            Icon(Icons.play_arrow, color: Colors.black54),
            SizedBox(width: 5,),
            Expanded(child: Text(text, style: TextStyle( color: Colors.black54),)),
          ],
        )
    ),
  );
}

Widget appHeader({context}){
  return GestureDetector(
    onTap: (){
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pushNamed(context, 'home');
    },
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      color: primaryColor,
      child: Column(
        children: [

          //FlutterLogo(size: 40,),
          Image(image: AssetImage('assets/component/demologo.png'),height: 194, width: 282,),

        ],
      ),
    ),
  );
}
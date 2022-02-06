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
          color: primaryColor,
          child: ListView(

              children: [
                SizedBox(height: 50,),
                appHeader(context: context),
                SizedBox(height: 20,),
                Divider(color: Colors.blue, thickness: 1,),
                buildMenuItem(text: "ডেটা স্ট্যাকচার (DataStructure)", icon: Icons.home_outlined, context: context, ID: 'home'),
                ExpansionTile(title: buildMenuItem(text: "অ্যাারে (Array)", icon: Icons.add, context: context, ID: 'array'),
                  children: [
                    textButton(text: 'Array Traversing', ID: 'arraytraversing', context: context),
                    textButton(text: 'More Array Operation', ID: 'updatearray', context: context),
                  ],),
                ExpansionTile(title: buildMenuItem(text: "লিংকড লিস্ট (Linked List)", icon: Icons.add, context: context, ID: 'linkedlist'),
                  children: [
                    textButton(text: 'Create & Print Linked List', ID: 'createlinkedlist', context: context),
                    textButton(text: 'Insert, Delete & Search Operation', ID: 'singlylinkedlist', context: context),
                    textButton(text: 'Insertion of Doubly Linked List', ID: 'doublyinsertion', context: context),
                    textButton(text: 'Deletion of Doubly Linked List', ID: 'doublydeletion', context: context),
                    textButton(text: 'Doubly Linked List', ID: 'doublylinkedlist', context: context),
                    textButton(text: 'Circular Linked List', ID: 'circularlinkedlist', context: context),
                    textButton(text: 'Doubly Circular Linked List', ID: 'circularlinkedlist2', context: context),
                  ],),
                ExpansionTile(title: buildMenuItem(text: "স্ট্যাক (Stack)", icon: Icons.add, context: context, ID: 'stack'),
                  children: [
                    textButton(text: 'Bracket Balancing', ID: 'bracket', context: context),
                  ],),
                ExpansionTile(title: buildMenuItem(text: "কিউ (Queue)", icon: Icons.add, context: context, ID: 'queue'),
                  children: [
                    textButton(text: 'Dequeue', ID: 'dequeue', context: context),
                  ],),
                ExpansionTile(title: buildMenuItem(text: "ট্রি (Tree)", icon: Icons.add, context: context, ID: 'tree'),
                  children: [
                    textButton(text: 'Application & Classification', ID: 'applicationoftree', context: context),
                    textButton(text: 'Binary Search Tree', ID: 'binarysearchTRee', context: context),
                    textButton(text: 'Binary Search Tree Traversal', ID: 'treetraversal', context: context),
                    textButton(text: 'Find max. & min. in BST', ID: 'maxmin', context: context),
                    textButton(text: 'Delete any node of BST', ID: 'deletenode', context: context),
                  ],),

                buildMenuItem(text: "হ্যাশটেবিল (HashTable)", icon: Icons.add, context: context, ID: 'hashtable'),
                buildMenuItem(text: "কমপ্লেক্সিটি (Complexity)", icon: Icons.access_time, context: context, ID: 'complexity'),
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
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pushNamed(context, ID);
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
    child: Column(
      children: [
        SizedBox(width: 24,),
        //FlutterLogo(size: 40,),
        Image(image: AssetImage('Images/logo_dsa.png'),height: 55, width: 55,),
        SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Easy ",style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500, color: Colors.black87)),
            SizedBox(width: 0,),
            Text("DS", style: TextStyle(fontSize: 30,color: Colors.blue, fontWeight: FontWeight.w500),)
          ],
        ),

      ],
    ),
  );
}
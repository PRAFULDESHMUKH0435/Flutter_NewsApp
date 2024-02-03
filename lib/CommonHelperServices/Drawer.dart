import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Screens/AboutScreen.dart';
import 'package:newsapp/Screens/QueAndAns.dart';
import 'package:newsapp/Screens/TAB1.dart';
import 'package:newsapp/Screens/TAB2.dart';
import 'package:newsapp/Screens/TAB3.dart';
import 'package:newsapp/Screens/TAB4.dart';
import 'package:newsapp/Screens/TAB5.dart';
class MyDRawer extends StatelessWidget {
   MyDRawer({super.key});

  final user = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            DrawerHeader(child: Row(
              children: [
                Expanded(
                    flex:1,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/Images/img2.jpg'),
                    )),
                SizedBox(width: 8,),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      Text(user?.email.toString()??"Null",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,overflow: TextOverflow.clip),)
                    ],
                  ),
                )
              ],
            )),
            Column(
              children: [
                ListTile(
                  title: Text("Home",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  leading: Icon(Icons.home),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text("Technology",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  leading: Icon(Icons.wifi),
                  onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>TAB1()));
                  },
                ),
                ListTile(
                  title: Text("Finance",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  leading: Icon(Icons.monetization_on),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>TAB2()));
                  },
                ),
                ListTile(
                  title: Text("National",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  leading: Icon(Icons.location_city_sharp),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>TAB3()));
                  },
                ),
                ListTile(
                  title: Text("International",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  leading: Icon(Icons.camera),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>TAB4()));
                  },
                ),


                ListTile(
                  title: Text("Health",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  leading: Icon(Icons.health_and_safety_outlined),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>TAB5()));
                  },
                ),

                ListTile(
                  title: Text("About Us",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  leading: Icon(Icons.info_outline),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutScreen()));
                  },
                ),

                ListTile(
                  title: Text("Que & Ans",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  leading: Icon(Icons.question_answer),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>QueAndAns()) );
                  },
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}

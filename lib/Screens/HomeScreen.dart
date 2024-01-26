import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsapp/CommonHelperServices/Drawer.dart';
import 'package:newsapp/CommonHelperServices/InternetConnectionCheck.dart';
import 'package:newsapp/Screens/LoginScreen.dart';
import 'package:newsapp/Screens/TAB5.dart';
import 'TAB1.dart';
import 'TAB2.dart';
import 'TAB3.dart';
import 'TAB4.dart';
class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  InternetConnectionCheck check = InternetConnectionCheck();


  @override
  Widget build(BuildContext context) {
    print("Build Method");
    return WillPopScope(
      onWillPop: ()=>_OnBackPressed(context),
      child: DefaultTabController(
          length: 5,
          child: Scaffold(
            drawer: MyDRawer(),
            appBar: AppBar(
              actions: [
                /// LOGOUT FUNCTION
                IconButton(onPressed: (){
                  showDialog(context: context,
                      builder: (context){
                         return AlertDialog(
                           title: Text("Logout ?"),
                           content: Text("Are You Sure You Want To Logout "),
                           actions: [
                             ElevatedButton(onPressed: ()=>Navigator.of(context).pop(true), child: Text("No")),
                             ElevatedButton(onPressed: () async{
                               await FirebaseAuth.instance.signOut();
                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successfully Logged Out ")));
                               Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false);
                             }, child: Text("Yes")),
                           ],
                         );
                      });
                }, icon: Icon(Icons.logout))
                ///
              ],
              backgroundColor: Colors.grey,
              title: Text("वार्ताहार",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              bottom: TabBar(
                isScrollable: true,
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                tabs: [
                  Tab(child: Text("Technology",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),),
                  Tab(child: Text("Finance",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),),
                  Tab(child: Text("National",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),),
                  Tab(child: Text("International",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),),
                  Tab(child: Text("Health",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                TAB1(),
                TAB3(),
                TAB2(),
                TAB4(),
                TAB5(),
              ],
            ),
          )),
    );
  }

  Future<bool> _OnBackPressed(BuildContext context) async{
    bool? exitapp = await showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text("वार्ताहार Says !",style: TextStyle(fontWeight: FontWeight.bold),),
            content: Text("Are You Sure You Want To Exit"),
            actions: [
              OutlinedButton(onPressed: ()=>Navigator.of(context).pop(false), child: Text("No")),
              OutlinedButton(onPressed: ()=>SystemNavigator.pop(), child: Text("Yes")),
            ],
          );
        });
    return exitapp??false;
  }
}

import 'package:flutter/material.dart';
import 'package:newsapp/CommonHelperServices/Drawer.dart';
import 'package:newsapp/Screens/TAB5.dart';
import 'TAB1.dart';
import 'TAB2.dart';
import 'TAB3.dart';
import 'TAB4.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                           title: Text("Exit ?"),
                           content: Text("Are You Sure You Want To Exit "),
                           actions: [
                             ElevatedButton(onPressed: (){

                             }, child: Text("Yes")),
                             ElevatedButton(onPressed: ()=>Navigator.of(context).pop(true), child: Text("No")),
                           ],
                         );
                      });
                }, icon: Icon(Icons.logout))
                ///
              ],
              backgroundColor: Colors.grey,
              title: Text("Your's Daily",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
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
            title: Text("Your's Daily Says !"),
            content: Text("Are You Sure You Want To Exit"),
            actions: [
              OutlinedButton(onPressed: ()=>Navigator.of(context).pop(false), child: Text("No")),
              OutlinedButton(onPressed: ()=>Navigator.of(context).pop(true), child: Text("Yes")),
            ],
          );
        });
    return exitapp??false;
  }

}

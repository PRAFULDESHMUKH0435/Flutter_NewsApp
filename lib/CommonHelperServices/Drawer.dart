import 'package:flutter/material.dart';
import 'package:newsapp/Screens/TAB1.dart';
import 'package:newsapp/Screens/TAB2.dart';
import 'package:newsapp/Screens/TAB3.dart';
import 'package:newsapp/Screens/TAB4.dart';
class MyDRawer extends StatelessWidget {
  const MyDRawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(child: Row(
            children: [
              Expanded(
                  flex:1,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(''),
                  )),
              SizedBox(width: 8,),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Praful",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Text("praful0435@gmail.com",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,overflow: TextOverflow.clip),)
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

            ],
          )
        ],
      ),
    );
  }
}

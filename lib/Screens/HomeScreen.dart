import 'package:flutter/material.dart';

import 'TAB1.dart';
import 'TAB2.dart';
import 'TAB3.dart';
import 'TAB4.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey,
            title: Text("Your's Daily",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              tabs: [
                Tab(child: Text("Technology",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),),
                Tab(child: Text("Finanace",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),),
                Tab(child: Text("National",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),),
                Tab(child: Text("International",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              TAB1(),
              TAB2(),
              TAB3(),
              TAB4(),
            ],
          ),
        ));

  }
}

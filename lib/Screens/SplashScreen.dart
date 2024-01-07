import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newsapp/CommonHelperServices/FetchAPIData.dart';

import 'HomeScreen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  FETCHAPIDATA fetchapidata = FETCHAPIDATA();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      fetchapidata.ForTab1();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/Images/newsbackgroundimage.jpg'),fit: BoxFit.fill)
        ),
        
        child: Padding(
          padding: EdgeInsets.only(top: 550),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Your's Daily",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: Colors.white),),
              SizedBox(height: 10,),
              Text("Your One Stop App For All National And \nInternational News",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white))
            ],
          ),
        ),
      ),
    );
  }
}

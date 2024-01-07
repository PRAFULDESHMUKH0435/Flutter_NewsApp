import 'package:flutter/material.dart';
import 'package:newsapp/Screens/HomeScreen.dart';

import 'Screens/SplashScreen.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

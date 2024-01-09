import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class InternetConnectivity {

  Connectivity connectivity = Connectivity();
  String status ="";
   Future CheckConnectivityResult(BuildContext context) async{
    final result = await connectivity.checkConnectivity();
    if(result == ConnectivityResult.none){
      showDialog(
          context: context,
          builder: (context){
        return AlertDialog(
          backgroundColor: Colors.grey,
          title: Text("No Internet Connection"),
          actions: [
            Container(
              child: OutlinedButton(onPressed: (){
                connectivity.checkConnectivity();
              }, child: Text("Retry")),
            )
          ],
        );
      });
    }


  }



}
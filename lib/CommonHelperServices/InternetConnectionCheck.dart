import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InternetConnectionCheck{

  Future<bool> checkInternetConnection(BuildContext context) async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // The device is connected to the internet
      print("Internet Connected");
      return true;
    } else {
      // The device is not connected to the internet
      print("No Internet Connection");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No Internet Connection"),backgroundColor: Colors.red,));
      return false;
    }
  }


  ShowSnackbar(BuildContext context,String msg){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

}
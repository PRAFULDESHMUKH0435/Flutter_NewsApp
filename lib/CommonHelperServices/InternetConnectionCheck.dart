import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InternetConnectionCheck{

  Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // The device is connected to the internet
      print("CONNECTED");
      return true;
    } else {
      // The device is not connected to the internet
      print("DISCONNECTED");
      return false;
    }
  }



  ShowSnackbar(BuildContext context,String msg){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

}
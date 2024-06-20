import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/Screens/LoginScreen.dart';

import '../CommonHelperServices/InternetConnectionCheck.dart';

class ForgotPasswordScreen extends StatelessWidget {
   ForgotPasswordScreen({super.key});
  final _forgotpasscontroller = TextEditingController();
   InternetConnectionCheck check = InternetConnectionCheck();
   bool exists = false;

  String? ForgotPasswordValidator(value){
    if(value?.isEmpty){
      return "Email Address Is Required";
    }
    final bool emailValid =
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    if(!emailValid){
      return "Invalid  Email Address";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        elevation: 2.0,
        title: Text("Forgot Password"),
        backgroundColor: Colors.yellow,
      ),

      body: ListView(
        children: [
          SizedBox(
            height: 250,
            child: Lottie.asset('assets/Animations/Anim_2.json'),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0,vertical: 25.0),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _forgotpasscontroller,
              validator: ForgotPasswordValidator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration:const InputDecoration(
                  suffixIcon: Icon(Icons.email),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14.0)),
                      borderSide: BorderSide(color: Colors.white70)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14.0)),
                      borderSide: BorderSide(color: Colors.green)
                  ),
                  label: Text("Email",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                  hintText: "Enter Email Address",
                  filled: true,
                  fillColor: Colors.grey
              ),
            ),
          ),
          InkWell(
            onTap: () async{
              if(_forgotpasscontroller.text.trim().toString().toLowerCase().isNotEmpty){
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context){
                      return Center(child: CircularProgressIndicator());
                    });
                await checkUserExistsOrnot(context,_forgotpasscontroller.text.trim().toString());
              }else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email Address Is Required ")));
              }
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 50.0),
              child: Center(child: Text("Send Link ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
              height: 60,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.all(Radius.circular(14.0))
              ),
            ),
          ),
        ],
      ),
    );
  }



   checkUserExistsOrnot(BuildContext context, String email) async{
    final _user = await FirebaseFirestore.instance.collection("Users").get()
      .then((value) => {
          value.docs.forEach((element) {
            print(element.get("EmailAddress"));
            if(element.get("EmailAddress")==email){
              print("User Exists");
              exists=true;
              SendResetLink(context,email);
            }
          }),
      if(exists==false){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("We Have Checked In Our Database , No Account Exists With ${email} Email Address"),duration: Duration(seconds: 5),)),
        Navigator.of(context).pop(),
      }
    }).onError((error, stackTrace) => {
      print(error.toString()),
      check.ShowSnackbar(context, error.toString()),
    });
  }

  void SendResetLink(BuildContext context,String email) async{
    try{
      final _auth = await FirebaseAuth.instance.sendPasswordResetEmail(email: _forgotpasscontroller.text.toString())
          .then((value){
        check.ShowSnackbar(context, "Password Reset Link Has Been Send To ${email} , kindly heck");
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password Reset Link Has Been Send To ${_forgotpasscontroller.text.toString()}")));
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false);
      }).onError((error, stackTrace){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
      });
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}


// ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("We Have Checked In Our Database , No Account Linked With ${email} Exists"),duration: Duration(seconds: 5),));
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:newsapp/Screens/HomeScreen.dart';

class Authentication {

  static void SaveUserData(User user) async{
    final ref =await FirebaseFirestore.instance.collection("Users").doc(user.uid);
    Map<String,dynamic> usermodel = {
      "UserName":user.displayName.toString(),
      "UserEmail":user.email.toString(),
      "UserPhone":user.phoneNumber.toString(),
      "UserUid":user.uid.toString(),
      "UserPhotoUrl":user.photoURL.toString(),
    };
    ref.set(usermodel)
        .then((value){
      print("USER DATA SAVED IS ${user}");
    }).onError((error, stackTrace){
      print("ERROR OCCURED ${error.toString()}");
    });

  }

  static Future<User?> signInWithGoogle({context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =await auth.signInWithCredential(credential);

        user = userCredential.user;
        if(user!=null){
          SaveUserData(user);
          print("Logged In As ${user}");
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Signed In As ${user.displayName}"),backgroundColor: Colors.green,));
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
          print(e);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
        }
        else if (e.code == 'invalid-credential') {
          // handle the error here
          print(e);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
          Navigator.pop(context);
        }
      } catch (e) {
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
    return user;
  }


}
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:newsapp/CommonHelperServices/GoogleSignIn.dart';
import 'package:newsapp/CommonHelperServices/InternetConnectionCheck.dart';
import 'package:newsapp/Screens/HomeScreen.dart';
class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
   InternetConnectionCheck check = InternetConnectionCheck();
  @override
  Widget build(BuildContext context) {
    check.checkInternetConnection(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/Images/img1.jpg'),fit: BoxFit.cover),
        ),

        child: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.8),
          child: Column(
            children: [
              SizedBox(height: 20,),
              InkWell(
                onLongPress: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                },
                child: Container(
                  child: SignInButton(
                    Buttons.Google,
                    text: "Sign up with Google",
                    onPressed: () {
                      showDialog(context: context, builder: (context)=>Center(child: CircularProgressIndicator()));
                      Authentication.signInWithGoogle(context: context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:newsapp/CommonHelperServices/GoogleSignIn.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              Container(
                child: SignInButton(
                  Buttons.Google,
                  text: "Sign up with Google",
                  onPressed: () {
                    Authentication.signInWithGoogle(context: context);
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

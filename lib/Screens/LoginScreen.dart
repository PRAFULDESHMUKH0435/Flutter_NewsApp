import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/CommonHelperServices/InternetConnectionCheck.dart';
import 'package:newsapp/Screens/HomeScreen.dart';
import 'package:newsapp/Screens/RegistrationScreen.dart';
class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   InternetConnectionCheck check = InternetConnectionCheck();

   final _usernamecontroller = TextEditingController();

   final _passwordcontroller = TextEditingController();

   bool isobsecured = true;

   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

   // FirebaseServices firebaseservices = FirebaseServices();

   String? UserNameValidator(value){
     if(value.isEmpty){
       return "This Field Is Required";
     }
     return null;
   }

   String? PasswordValidator(value){
     if(value.isEmpty){
       return "This Field Is Required";
     }
     return null;
   }

   @override
  Widget build(BuildContext context) {
    check.checkInternetConnection(context);
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0,vertical: 5.0),
              child: TextFormField(
                controller: _usernamecontroller,
                validator: UserNameValidator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration:const InputDecoration(
                    suffixIcon: Icon(Icons.person_outline),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14.0)),
                        borderSide: BorderSide(color: Colors.white70)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14.0)),
                        borderSide: BorderSide(color: Colors.green)
                    ),
                    label: Text("UserName",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    hintText: "Enter UserName",
                    filled: true,
                    fillColor: Colors.grey
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0,vertical: 5.0),
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: isobsecured,
                controller: _passwordcontroller,
                validator: PasswordValidator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                    suffixIcon: IconButton(icon:isobsecured?Icon(Icons.visibility_off_outlined):Icon(Icons.remove_red_eye),onPressed: (){
                      setState(() {
                        isobsecured=!isobsecured;
                      });
                    }),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14.0)),
                        borderSide: BorderSide(color: Colors.white70)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14.0)),
                        borderSide: BorderSide(color: Colors.green)
                    ),
                    label: Text("Password",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    hintText: "Enter Password",
                    filled: true,
                    fillColor: Colors.grey
                ),
              ),
            ),
            InkWell(
              onTap: () async{
                if(_formkey.currentState!.validate()){
                  SignInUser();
                  // firebaseservices.LoginUser(_usernamecontroller.text.toString(), _passwordcontroller.text.toString(),context);
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("All Fields Are Mandatory")));
                }
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5.0),
                child: Center(child: Text("Login",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
                height: 60,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.all(Radius.circular(14.0))
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Don't Have An Account",style: TextStyle(fontSize: 16),),
                  InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationScreen()));
                      },
                      child: Text("Create One",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future SignInUser()  async{
     // setState(() {
     //   _isloading=true;
     // });

     showDialog(context: context, builder: (context){
       return Center(child: CircularProgressIndicator());
     });

     final _auth = await FirebaseAuth.instance;
     _auth.signInWithEmailAndPassword(
         email: _usernamecontroller.text.toString(),
         password: _passwordcontroller.text.toString())
     .then((value){
       check.ShowSnackbar(context, "Login Successful");
       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeScreen()), (route) => false);
       Navigator.of(context).pop();
     }).onError((error, stackTrace){
       check.ShowSnackbar(context, error.toString());
       Navigator.of(context).pop();
     });

  }
}


///
// body: Container(
// height: double.infinity,
// width: double.infinity,
// decoration: BoxDecoration(
// image: DecorationImage(image: AssetImage('assets/Images/img1.jpg'),fit: BoxFit.cover),
// ),
//
// child: Container(
// margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.8),
// child: Column(
// children: [
// SizedBox(height: 20,),
// InkWell(
// onLongPress: (){
// Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
// },
// child: Container(
// child: SignInButton(
// Buttons.Google,
// text: "Sign up with Google",
// onPressed: () {
// showDialog(context: context, builder: (context)=>Center(child: CircularProgressIndicator()));
// Authentication.signInWithGoogle(context: context);
// },
// ),
// ),
// ),
// ],
// ),
// ),
// ),
///
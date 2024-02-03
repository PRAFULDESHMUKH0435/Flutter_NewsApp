import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/Screens/HomeScreen.dart';
import 'package:newsapp/Screens/LoginScreen.dart';
import '../CommonHelperServices/InternetConnectionCheck.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  InternetConnectionCheck check = InternetConnectionCheck();
  final _usernamecontroller = TextEditingController();
  final _phonecontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _addresscontroller = TextEditingController();
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

  String? EmailValidator(value){
    if(value.isEmpty){
      return "This Field Is Required ";
    }
    final bool emailValid =
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    if(!emailValid){
      return "Invalid  Email Address";
    }
    return null;
  }

  String? PhoneValidator(value){
    if(value.isEmpty){
      return "This Field Is Required";
    }
    if(value.length!=10){
      return "Mobile Number Should Be 10 Digit Long";
    }
    return null;
  }

  String? AddressValidator(value){
    if(value.isEmpty){
      return "This Field Is Required";
    }
    return null;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Form(
        key: _formkey,
        child: ListView(
          children: [
            SizedBox(
              height: 250,
              child: Lottie.asset('assets/Animations/Anim_1.json'),
            ),
            Container(
              margin: EdgeInsets.only(left: 8.0,right: 8.0,top: 20,bottom: 5.0),
              child: TextFormField(
                keyboardType: TextInputType.name,
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
                    label: Text("Full Name",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    hintText: "Enter Full Name",
                    filled: true,
                    fillColor: Colors.grey
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0,vertical: 5.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailcontroller,
                validator: EmailValidator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration:const InputDecoration(
                    suffixIcon: Icon(Icons.email_outlined),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14.0)),
                        borderSide: BorderSide(color: Colors.white70)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14.0)),
                        borderSide: BorderSide(color: Colors.green)
                    ),
                    label: Text("Email Address",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    hintText: "Enter Email Address",
                    filled: true,
                    fillColor: Colors.grey
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0,vertical: 5.0),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                controller: _phonecontroller,
                validator: PhoneValidator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration:const InputDecoration(
                    suffixIcon: Icon(Icons.phone_outlined),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14.0)),
                        borderSide: BorderSide(color: Colors.white70)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14.0)),
                        borderSide: BorderSide(color: Colors.green)
                    ),
                    label: Text("Phone",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    hintText: "Enter Mobile Number",
                    filled: true,
                    fillColor: Colors.grey
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0,vertical: 5.0),
              child: TextFormField(
                controller: _addresscontroller,
                validator: AddressValidator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration:const InputDecoration(
                    suffixIcon: Icon(Icons.location_city_outlined),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14.0)),
                        borderSide: BorderSide(color: Colors.white70)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14.0)),
                        borderSide: BorderSide(color: Colors.green)
                    ),
                    label: Text("Postal Address",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    hintText: "Enter Address ",
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
              onTap: (){
                if(_formkey.currentState!.validate()){
                  FocusManager.instance.primaryFocus?.unfocus();
                  CreateUserAndSaveData();
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("All Fields Are Mandatory")));
                }
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 50.0),
                child: Center(child: Text("Register",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
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
                  Text("Already Have An Account",style: TextStyle(fontSize: 16),),
                  InkWell(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                      },
                      child: Text("Login",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future CreateUserAndSaveData() async{

    showDialog(
        barrierDismissible: false,
        context: context, builder: (context){
      return Center(child: CircularProgressIndicator());
    });

    print("EMAIL AND PASSWORD IS ${_emailcontroller.text.toString()}, ${_passwordcontroller.text.toString()}");
    final _auth = await FirebaseAuth.instance;
    _auth.createUserWithEmailAndPassword(
        email: _emailcontroller.text.trim().toString(),
        password: _passwordcontroller.text.trim().toString())
    .then((value){
      check.ShowSnackbar(context, "Saving UserData");
      SaveUserData();
    }).onError((error, stackTrace){
      check.ShowSnackbar(context, error.toString());
      Navigator.of(context).pop();
    });
  }

  Future SaveUserData() async{
    final _ref = await FirebaseFirestore.instance.collection("Users");
    final temp = await FirebaseAuth.instance.currentUser?.uid;
    _ref.doc(temp).set({
      "FullName":_usernamecontroller.text.trim().toString(),
      "EmailAddress":_emailcontroller.text.trim().toString(),
      "PhoneNumber":_phonecontroller.text.trim().toString(),
      "PostalAddress":_addresscontroller.text.trim().toString(),
      "Password":_passwordcontroller.text.trim().toString(),
    }).then((value){
      check.ShowSnackbar(context, "UserData Saved");
      Navigator.of(context).pop();
      check.ShowSnackbar(context, "Signed In As ${_emailcontroller.text.toString()}");
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeScreen()), (route) => false);
      _emailcontroller.clear();
      _phonecontroller.clear();
      _addresscontroller.clear();
      _passwordcontroller.clear();
      _usernamecontroller.clear();
    }).onError((error, stackTrace){
      check.ShowSnackbar(context, error.toString());
      print(error.toString());
      Navigator.of(context).pop();
    });

  }
}

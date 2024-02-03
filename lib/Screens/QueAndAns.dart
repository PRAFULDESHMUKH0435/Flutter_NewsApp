import 'package:flutter/material.dart';
import 'package:newsapp/Constants/QueAnsContainer.dart';
class QueAndAns extends StatelessWidget {
   QueAndAns({super.key});
   final  emailaddress="helpappdevelopment49@gmail.com";

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Que And Answers"),
      ),
      body: ListView(
        children: [
          QueAnsContainer(que: "Does It Provides Daily Updated News", ans: "Yes , It Provides Updated News Which Fetches News From News API.org"),
          QueAnsContainer(que: "What If We Getting Issue While Fetching News?", ans: "You May Need To Wait For A While , Because In This App We Are Fetching News From NewsAPI.org in Free Plan, Which Gives Only 1000 Credits Per Day , So There Might Be More Requests Going to Server Which May Cause Error In Data Retrieving"),
          QueAnsContainer(que: "My Data Is Secured Or Not ? Why I need To Create Account To Access The App ?", ans: "Yes , Your Data Is Totally Secured And Neither any third Party or website has Access To Your Personal Data . We Are Registering the User With Name,Email,MobileNo,Address and Password to Manage Our Users"),
          QueAnsContainer(que: "How Can I Contact The Developer ? ", ans: "You Can Send Your Queries  On ${emailaddress} , Will Reach You Out There"),
          QueAnsContainer(que: "Does This App Supports Dark And Light Theme ? ", ans: "No , As Of Now , This Feature Is Not Added In App , It Will Be Available in Next Build"),
        ],
      ),
    );
  }
}

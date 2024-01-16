import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({super.key});

  String message = "Hey Users , Hope You Are Doing Great\n In This App You Can Browse  News In Various Categories Mentioned In App , This App Is Basic Prototype of News App\n"
      "This App is Fetching Data From NewsAPI.org free API Plan which has some limits of 1000 Credits per Day. In This App , When You Click On Any News Your Are Being Redirected To WebView Of That News \n"
      "There Might Be Question For Many Of You , why i am being Redirected to Webview ? instead of Loading content in next screen . the issue is that , Some News API's Doesn't Provide Whole"
      "Content of their News in Free Plan , so in order to solve this issue we need to redirect the user to Webview and For Us 2nd Option Was WebScrapping , But Some News Articles Doesn't Allow Users To Scrap Their Data . but in the Next Coming Future Builds "
      "This Issue Will Be Successfully Resolved with premium Plans And You Will Be Able To Access All Your News Content In App Only\n\n"
      "-----Praful Deshmukh----\n(Freelance App Developer)";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("About And Privacy Policy "),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(20.0))
          ),
          margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
          child:  Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text(message,style: TextStyle(
                fontSize: 20,fontWeight: FontWeight.bold
              ),),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
class DetailsScreen extends StatelessWidget {
  String url;
  String title;
  String content;
  String description;
  String urlToImage;
  DetailsScreen({required this.url,required this.title,required this.content,required this.description,required this.urlToImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your's Daily",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.grey,
      ),

      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(14.0))
        ),
        child: ListView(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(14.0))
              ),
              child: Image.network(urlToImage,fit: BoxFit.fill,),
            ),
            Text(title,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            Expanded(child: Text(content)),
          ],
        ),
      ),
    );
  }
}

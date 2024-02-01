import 'package:flutter/material.dart';
import 'package:newsapp/Screens/DetailsScreen.dart';
class SingleContainer extends StatelessWidget {
  String url;
  String title;
  String content;
  String description;
  String urlToImage;
   SingleContainer({required this.url,required this.title,required this.content,required this.description,required this.urlToImage});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async{
        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(
          url: url,
        )));



      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.0,vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(14.0)),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 50,
                backgroundImage: NetworkImage(urlToImage),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(title,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  Text(description,style: TextStyle(fontSize: 20,overflow: TextOverflow.ellipsis))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

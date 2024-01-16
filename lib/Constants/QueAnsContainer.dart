import 'package:flutter/material.dart';
class QueAnsContainer extends StatelessWidget {
   String que;
   String ans;
   QueAnsContainer({required this.que,required this.ans});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0,vertical: 5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(14.0)),
          color: Colors.green
      ),
      child: ListTile(
        title: Text(que,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        subtitle: Text(ans,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
      ),
    );
  }
}





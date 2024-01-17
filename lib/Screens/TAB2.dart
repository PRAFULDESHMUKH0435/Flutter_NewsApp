import 'package:flutter/material.dart';
import 'package:newsapp/Constants/SingleContainer.dart';

import '../CommonHelperServices/FetchAPIData.dart';
class TAB2 extends StatefulWidget {
  TAB2({super.key});

  @override
  State<TAB2> createState() => _TAB2State();
}

class _TAB2State extends State<TAB2> {
  FETCHAPIDATA fetchapidata = FETCHAPIDATA();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: FutureBuilder(
        future: fetchapidata.ForTab2(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }else if(snapshot.connectionState==ConnectionState.done ||snapshot.connectionState==ConnectionState.active){
            return ListView.builder(
                itemCount: fetchapidata.list2.length,
                itemBuilder: (context,index){
                  return SingleContainer(
                    url: fetchapidata.list2[index].url.toString(),
                    title: fetchapidata.list2[index].title.toString(),
                    content: fetchapidata.list2[index].content.toString(),
                    description: fetchapidata.list2[index].description.toString(),
                    urlToImage: fetchapidata.list2[index].urlToImage.toString(),
                  );
                });
          }else{
            return Text("Something Went Wrong");
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:newsapp/CommonHelperServices/InternetConnectionCheck.dart';
import 'package:newsapp/Constants/SingleContainer.dart';

import '../CommonHelperServices/FetchAPIData.dart';
class TAB4 extends StatefulWidget {
  TAB4({super.key});

  @override
  State<TAB4> createState() => _TAB4State();
}

class _TAB4State extends State<TAB4> {
  FETCHAPIDATA fetchapidata = FETCHAPIDATA();
  InternetConnectionCheck check = InternetConnectionCheck();

  @override
  Widget build(BuildContext context) {
    check.checkInternetConnection(context);
    return Scaffold(
      backgroundColor: Colors.grey,
      body: FutureBuilder(
        future: fetchapidata.ForTab4(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }else if(snapshot.connectionState==ConnectionState.done ||snapshot.connectionState==ConnectionState.active){
            return ListView.builder(
                itemCount: fetchapidata.list4.length,
                itemBuilder: (context,index){
                  return SingleContainer(
                    url: fetchapidata.list4[index].url.toString(),
                    title: fetchapidata.list4[index].title.toString(),
                    content: fetchapidata.list4[index].content.toString(),
                    description: fetchapidata.list4[index].description.toString(),
                    urlToImage: fetchapidata.list4[index].urlToImage.toString(),
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

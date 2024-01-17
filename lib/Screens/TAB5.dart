import 'package:flutter/material.dart';
import 'package:newsapp/CommonHelperServices/InternetConnectivity.dart';
import 'package:newsapp/Constants/SingleContainer.dart';
import '../CommonHelperServices/FetchAPIData.dart';
class TAB5 extends StatefulWidget {
  TAB5({super.key});

  @override
  State<TAB5> createState() => _TAB5State();
}

class _TAB5State extends State<TAB5> {
  FETCHAPIDATA fetchapidata = FETCHAPIDATA();
  InternetConnectivity internetConnectivity = InternetConnectivity();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: FutureBuilder(
        future: fetchapidata.ForTab5(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }else if(snapshot.connectionState==ConnectionState.done ||snapshot.connectionState==ConnectionState.active){
            return ListView.builder(
                itemCount: fetchapidata.list5.length,
                itemBuilder: (context,index){
                  print("i am inside tab5 builder");
                  return SingleContainer(
                    url: fetchapidata.list5[index].url.toString(),
                    title: fetchapidata.list5[index].title.toString(),
                    content: fetchapidata.list5[index].content.toString(),
                    description: fetchapidata.list5[index].description.toString(),
                    urlToImage: fetchapidata.list5[index].urlToImage.toString(),
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

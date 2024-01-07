import 'package:flutter/material.dart';

import '../CommonHelperServices/FetchAPIData.dart';
class TAB1 extends StatelessWidget {
   TAB1({super.key});
  FETCHAPIDATA fetchapidata = FETCHAPIDATA();

  @override
  Widget build(BuildContext context) {
    print(fetchapidata.list.length);
    return Scaffold(
       // body: FutureBuilder(
       //   future: fetchapidata.ForTab1(),
         // builder: (context,snapshot){
           // if(snapshot.connectionState==ConnectionState.waiting){
           //   return Center(child: CircularProgressIndicator());
           // }else if(snapshot.connectionState==ConnectionState.done ||snapshot.connectionState==ConnectionState.active){
           //   return ListView.builder(
           //       itemCount: snapshot.data!.length,
           //       itemBuilder: (context,index){
           //         print("Length Is ${fetchapidata.list.length}");
           //         return Text(fetchapidata.list[index].title.toString());
           //    });
           // }else{
           //   return Text("Something Went Wrong");
           // }
         // },
       // ),
    );
  }
}

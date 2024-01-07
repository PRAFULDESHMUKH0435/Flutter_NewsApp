import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/Models/DatModel.dart';

class FETCHAPIDATA{
  static const endpoint = 'https://newsapi.org/v2/everything?q=tesla&from=2023-12-07&sortBy=publishedAt&apiKey=b64dfee38c5f49b6b09bc9f4f2cd1472';
  List<NewsModel> list=[];

    Future <List<NewsModel>>ForTab1() async{
     final response = await http.get(Uri.parse(endpoint));
     if(response.statusCode==200){
       var data = jsonDecode(response.body);
       print("data length is ${data}");
     }else{
       print(response.statusCode);
     }
     print(list.length);
     return list;
  }

}
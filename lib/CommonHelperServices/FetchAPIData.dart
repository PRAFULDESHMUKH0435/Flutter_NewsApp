import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/Models/DataModel(1,4).dart';
import 'package:newsapp/Models/TAB3MODEL.dart';


class FETCHAPIDATA{
  ///  TECHNOLOGY
  static const endpoint1 = 'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=b64dfee38c5f49b6b09bc9f4f2cd1472';
  ///  FINANCE
  static const endpoint2 = 'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=b64dfee38c5f49b6b09bc9f4f2cd1472';
  /// NATIONAL
  static const endpoint3 = 'https://newsdata.io/api/1/news?apikey=pub_36024b108d2036087f0334350b33c328b453c&q=finance&country=in';
  /// INTERNATIONAL
  static const endpoint4 = 'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=b64dfee38c5f49b6b09bc9f4f2cd1472';

  List<NewsModel> list1=[];
  List<NewsModel> list2=[];
  List<TAB3MODEL> list3=[];
  List<NewsModel> list4=[];

    ForTab1() async{
     final response = await http.get(Uri.parse(endpoint1));
     if(response.statusCode==200){
       var data = jsonDecode(response.body)['articles'];
       for(Map<String,dynamic> i in data){
           list1.add(NewsModel(
             url: i['url'],
             title: i['title'],
             // author: i['author']??[''],
             content: i['content'],
             description: i['description'],
             // source: i['source']['name'],
             urlToImage: i['urlToImage'],
           ));
       }
     }else{
       print(response.statusCode);
     }
     print("LIST1 Is ${list1}");
  }


    ForTab2() async{
      final response = await http.get(Uri.parse(endpoint1));
      if(response.statusCode==200){
        var data = jsonDecode(response.body)['articles'];
        for(Map<String,dynamic> i in data){
          list2.add(NewsModel(
            url: i['url'],
            title: i['title'],
            // author: i['author']??[''],
            content: i['content'],
            description: i['description'],
            // source: i['source']['name'],
            urlToImage: i['urlToImage'],
          ));
        }
      }else{
        print(response.statusCode);
      }
      print("LIST2 Is ${list2}");
    }


    ForTab3() async{
      final response = await http.get(Uri.parse(endpoint3));
      if(response.statusCode==200){
        var data = jsonDecode(response.body)['results'];
        for(Map<String,dynamic> i in data){
             list3.add(
               TAB3MODEL(
                   title: i['title'],
                   creator: i['creator'],
                   description: i['description'],
                   content: i['content'],
                   pubDate: i['pubDate']
               )
             );
        }
      }else{
        print(response.statusCode);
      }
      print("LIST3 Is ${list3}");
    }


    ForTab4() async{
      final response = await http.get(Uri.parse(endpoint4));
      if(response.statusCode==200){
        var data = jsonDecode(response.body)['articles'];
        for(Map<String,dynamic> i in data){
          list4.add(NewsModel(
            url: i['url'],
            title: i['title'],
            // author: i['author']??[''],
            content: i['content'],
            description: i['description'],
            // source: i['source']['name'],
            urlToImage: i['urlToImage'],
          ));
        }
      }else{
        print(response.statusCode);
      }
      print("Count Is ${list4}");
    }

}
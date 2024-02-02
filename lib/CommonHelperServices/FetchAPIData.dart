import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/Models/NewsModel.dart';
import 'package:newsapp/Screens/HomeScreen.dart';
import 'package:newsapp/Screens/LoginScreen.dart';

class FETCHAPIDATA {
  ///  TECHNOLOGY
  static const endpoint1 =
      'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=b64dfee38c5f49b6b09bc9f4f2cd1472';

  ///  FINANCE
  static const endpoint2 =
      'https://newsapi.org/v2/top-headlines?country=in&apiKey=b64dfee38c5f49b6b09bc9f4f2cd1472';

  /// NATIONAL
  static const endpoint3 =
      'https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=b64dfee38c5f49b6b09bc9f4f2cd1472';

  /// INTERNATIONAL
  static const endpoint4 =
      'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=b64dfee38c5f49b6b09bc9f4f2cd1472';

  static const endpoint5 =
      'https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=b64dfee38c5f49b6b09bc9f4f2cd1472';

  List<NewsModel> list1 = [];
  List<NewsModel> list2 = [];
  List<NewsModel> list3 = [];
  List<NewsModel> list4 = [];
  List<NewsModel> list5 = [];

  CheckUserIsLoggedInOrNot(BuildContext context) async {
    final user = await FirebaseAuth.instance.currentUser;
    print("USER IS ${user}");
    if (user == null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  ForTab1() async {
    final response = await http.get(Uri.parse(endpoint1));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['articles'];
      for (Map<String, dynamic> i in data) {
        list1.add(NewsModel(
          url: i['url']??"",
          title: i['title']??"null",
          content: i['content']??"null",
          description: i['description']??"null",
          urlToImage: i['urlToImage']??"https://cdn.vectorstock.com/i/preview-1x/82/99/no-image-available-like-missing-picture-vector-43938299.jpg",
        ));
      }
    } else {
      print("Error with Status Code${response.statusCode}");
    }
    print("LIST1 Is ${list1}");
  }

  ForTab2() async {
    final response = await http.get(Uri.parse(endpoint2));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['articles'];
      for (Map<String, dynamic> i in data) {
        list2.add(NewsModel(
          url: i['url']??"",
          title: i['title']??"null",
          content: i['content']??"null",
          description: i['description']??"null",
          urlToImage: i['urlToImage']??"https://cdn.vectorstock.com/i/preview-1x/82/99/no-image-available-like-missing-picture-vector-43938299.jpg",
        ));
      }
    } else {
      print("Error with Status Code${response.statusCode}");
    }
    print("LIST2 Is ${list2}");
  }

  ForTab3() async {
    final response = await http.get(Uri.parse(endpoint3));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['articles'];
      for (Map<String, dynamic> i in data) {
        list3.add(NewsModel(
          url: i['url']??"",
          title: i['title']??"null",
          content: i['content']??"null",
          description: i['description']??"null",
          urlToImage: i['urlToImage']??"https://cdn.vectorstock.com/i/preview-1x/82/99/no-image-available-like-missing-picture-vector-43938299.jpg",
        ));
      }
    } else {
      print("Error with Status Code${response.statusCode}");
    }
    print("LIST3 Is ${list3}");
  }


  ForTab4() async {
    final response = await http.get(Uri.parse(endpoint4));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['articles'];
      print("TAB4 data is ${data}");
      for (Map<String, dynamic> i in data) {
        list4.add(NewsModel(
          url: i['url']??"",
          title: i['title']??"null",
          content: i['content']??"null",
          description: i['description']??"null",
          urlToImage: i['urlToImage']??"https://cdn.vectorstock.com/i/preview-1x/82/99/no-image-available-like-missing-picture-vector-43938299.jpg",
        ));
      }
      print("List4 Data Is ${list4}");
    } else {
      print("Error with Status Code${response.statusCode}");
    }
    print("List4 Is ${list4}");
  }



  ForTab5() async{
    final response = await http.get(Uri.parse(endpoint5));
    if(response.statusCode==200){
      var data = jsonDecode(response.body)['articles'];
      print("TAB 5 DATA IS ${data}");
      for(Map<String,dynamic> i in data){
        list5.add(NewsModel(
          url: i['url']??"",
          title: i['title']??"null",
          content: i['content']??"null",
          description: i['description']??"null",
          urlToImage: i['urlToImage']??"https://cdn.vectorstock.com/i/preview-1x/82/99/no-image-available-like-missing-picture-vector-43938299.jpg",
        ));
      }
    }else{
      print("Error with Status Code${response.statusCode}");
    }
    print("LIST1 Is ${list5}");
  }
}

import 'dart:convert';
import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart'as http;

class News{
  List<ArticleModel>news = [];
  Future<void> getNews() async{
    String url='http://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=c6ec0e98a9594a70a19766d503223ce3';
  var response = await http.get(url);
  dynamic  jsonData = jsonDecode(response.body);
  //Map<String,dynamic>jsonData = jsonDecode(response.body) as Map<String,dynamic>;
  if(jsonData['status']=='ok'){
    jsonData['articles'].forEach(( dynamic element){
        if(element['urlToImage']!=null&& element['description']!=null){
          ArticleModel articleModel = ArticleModel(
           title:element['title'].toString(),
           description:element['description'].toString(),
          url:element['url'].toString(),
           urlToImage:element['urlToImage'].toString(),
           author: element['author'].toString(),



          );
          news.add(articleModel);

        }

    });

    }
  }
  }

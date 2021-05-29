import 'dart:convert';

import 'package:http/http.dart';

import 'article_model.dart';
class ApiService{
  final url = Uri.parse("https://api.first.org/data/v1/news");
  Future<List<Article>>getArticle()async{
    Response res = await get(url);
    if(res.statusCode==200){
      Map<String,dynamic> json = jsonDecode(res.body);
      List<dynamic>body = json['data'];
      List<Article> articles = body.map((dynamic item)=>Article.fromJson(item)).toList();
      return articles;
  }
  else{
    throw('cant get the Articles');
  }}

}
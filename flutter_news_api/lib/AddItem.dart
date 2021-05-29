import 'package:flutter/material.dart';
import 'article_model.dart';
class AddItem extends ChangeNotifier{
  List<Article> itemList = [];
  addItem(String itemName,String sum,String pub) async{
    Article item = Article(title:itemName,summary: sum,published: pub );
    itemList.add(item);
    notifyListeners();
  }
}
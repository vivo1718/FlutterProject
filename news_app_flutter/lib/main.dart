import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/views/home.dart';

void main(){
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0xffeeeeee)
  ));
  runApp(MyApp());}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      
     // FlutterStatusbarcolor.setStatusBarColor(Colors.white),
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        primaryColor:Colors.white
      ),
      home: NewsApp(),
    );
  }
}

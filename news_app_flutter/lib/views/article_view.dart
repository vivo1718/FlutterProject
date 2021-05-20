import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class Article extends StatefulWidget {
  final String blogurl;
  Article({this.blogurl});
  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  final Completer<WebViewController> _completer = Completer<WebViewController>();
  
       var _scrollViewController = ScrollController();

  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xffeeeeee),
            title: Text('Details',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Color(0xff3f51b5),
              
            ),),
            elevation: 0.0,
            centerTitle: true,
          ),



        body: 
   Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        child: 
        WebView(
          initialUrl: widget.blogurl,
          javascriptMode:JavascriptMode.unrestricted ,
          onWebViewCreated: ((WebViewController webViewController){
            _completer.complete(webViewController);
          }),
        ),
        
      ),
      );
    
      
          
    
  }
}
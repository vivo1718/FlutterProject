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
  
  
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 38,
        flexibleSpace: Container(

          decoration: BoxDecoration(
            
            gradient: LinearGradient(colors: [Colors.blue,Colors.green],
            begin: Alignment.topLeft,
            end:Alignment.bottomRight
            ),
           ),),
      
        centerTitle: true,
        title: 
          Text("Details",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 14,color: Colors.white),),


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
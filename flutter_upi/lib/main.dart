import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'UserData.dart';
import 'bottomsheetwidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],

      bottomSheet: Container(
        color: Colors.grey[300],
        child: BottomSheetWidget()),
      appBar: AppBar(
        backgroundColor: Colors.white,
        
        elevation: 0.0,
        centerTitle: true,
        leading: Icon(Icons.arrow_back,color: Colors.black,size: 20,),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Savings',style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),),
      ),
      body:Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text('Pay through UPI',style: TextStyle(
                fontSize: 13,
                color: Colors.black,
                
                fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(height:10),
              Padding(
                padding: const EdgeInsets.only(left:15.0,right:15.0),

                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter UPI Number ',
                    hintStyle: TextStyle(fontSize: 13)
                  ),
                ),
              ),

            ],),

          ),
          SizedBox(height:10),
          Expanded(
            child: Container(
              color: Colors.grey[300],
              width: double.infinity,
              height: 300,
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top:70),
                    child: Container(
                      
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin:  FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
                          colors: [
                            Colors.grey,
                          Colors.grey.shade200,
                          
                        ]),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border:Border.all(color: Colors.white,width: 2.4)
                      ),
                      
                      ),
                  ),
                ],
              ),
            ),
          ),
         ],

      ) ,
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}




import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_api/AddItem.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';




import 'MainPage.dart';void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddItem>(
      create: (BuildContext context) { return AddItem(); },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
  bool _isloading = false;
  TextEditingController emailC = new TextEditingController();
    TextEditingController passC = new TextEditingController();
    SharedPreferences sharedPreferences;
    @override
    void initState(){
      super.initState();
      
    }
    


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              children: [
              // Icon(Icons.new_releases),
                Padding(
                  padding: const EdgeInsets.only(top:300.0),
                  child:Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        color: Color(0xffE0E0E0),
                        borderRadius: BorderRadius.only(topRight: Radius.circular(80)),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/1.7,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                        
                          children:[
                            Text('Login',style: TextStyle(fontSize: 30,fontStyle: FontStyle.italic,color:Color(0xff455A64),fontWeight: FontWeight.bold),),
                            SizedBox(height: 40,),
                            SizedBox(
                            height: 50,
                            width: 290,
                            child: TextFormField(
                              controller: emailC,
                              decoration: InputDecoration(
                                fillColor: Color(0xff757575),
                              focusColor: Color(0xff757575),
                                hintText: 'Enter Email',
                                labelText: 'Email',
                                labelStyle: TextStyle(color: Colors.blue),
                  
                            prefixIcon:Icon(CupertinoIcons.mail_solid,color: Colors.blue,),
                                  hintStyle: TextStyle(color: Colors.grey[600],fontSize: 15),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                                  border: OutlineInputBorder(borderSide: BorderSide()),
                  
                                ),
                  
                            
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: Colors.grey[600]),
                              textAlign: TextAlign.start,
                              
                            ),
                          ) ,
                          SizedBox(height: 20,),
                          SizedBox(
                            height: 50,
                            width: 290,
                            child: TextFormField(
                              
                              controller: passC,
                              decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon:Icon(CupertinoIcons.padlock_solid,color: Colors.blue,),
                              labelStyle: TextStyle(color: Colors.blue),
                               // prefixStyle: TextStyle(color: Colors.grey),
                               // suffixIcon: Icon(Icons.remove_red_eye_outlined,color: Colors.grey,),
                                hintText: 'Enter Password',
                                hintStyle: TextStyle(color: Colors.grey[600],fontSize: 15),
                              alignLabelWithHint: false,
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                                  border: OutlineInputBorder(borderSide: BorderSide()),
                  
                                
                              ),
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.grey[600]),
                              obscureText: true,
                              
                              
                              
                              textAlign: TextAlign.start,
                              
                            ),
                          ) ,
                          SizedBox(height: 20,),
                          TextButton(onPressed: (){
                       if(emailC.text.toString()=="omtiwarimaa92@gmail.com" && passC.text.toString()=="1234"){
                         Navigator.push(context, MaterialPageRoute(builder:(contxt)=>mainPage()));
                       }
                            //signIn(emailC.text,passC.text);
                  
                          }, 
                          child:Container(
                            alignment: Alignment.center,
                            color: Colors.blue,
                            height:50,
                            width: 290,
                            child: 
                          Text('Login',style:TextStyle(color: Colors.white) ,)
                          ) 
                          ),
                          
                          
                          ]
                        ),
                      ),
                      ),
                  ),
                ),
              ],
            ),
          ),
        ),
      
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  
}

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext build){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: new ThemeData(
        primarySwatch:Colors.blue),
    );
  }
}
class LoginPage extends StatefulWidget{
  @override
  State createState()=> new LoginPageState();

}
class LoginPageState extends State<LoginPage>{
  var mycontroller1 = TextEditingController();
    var mycontroller2 = TextEditingController();
    final key = new GlobalKey<ScaffoldState>();
    

  @override
  void dispose(){
    mycontroller1.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext build){
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor:Colors.black ,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(image: new AssetImage("assets/boybehind.webp"),
          fit: BoxFit.cover,
          color: Colors.black54,
          colorBlendMode: BlendMode.darken,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset("assets/flutter.png",
                ),
              ),
               Stack(
                  children:[
                    SingleChildScrollView(
                      child:Container(
                      height: 290.0,
                      width: 330.0,
                      padding: EdgeInsets.symmetric(
                        horizontal:20.0,
                        vertical:20.0
                      ),
                      decoration: BoxDecoration(
                        
                        color:Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    child:Column(
                       children: [
                        Padding(
                          padding:EdgeInsets.symmetric(
                            vertical: 20.0,
                          
                          ),
                         child:TextField(
                           controller: mycontroller1,
                           autocorrect: false,
                           keyboardType: TextInputType.name,
                           autofocus: false,
                           style: TextStyle(
                             fontSize: 15.0,
                             fontWeight: FontWeight.normal

                           ),
                           
                           decoration: InputDecoration(
                             hintText:"Username",
                            
                             border:InputBorder.none,
                             filled:true,
                             fillColor: Colors.grey[300],
                             contentPadding: EdgeInsets.all(15.0),
                            
                           ),
                         
                         ),
                          ),
                          TextField(
                           controller: mycontroller2,
                           autocorrect: false,
                           keyboardType: TextInputType.name,
                           obscureText: true,
                           
                           autofocus: false,
                           style: TextStyle(
                             fontSize: 15.0,
                             fontWeight: FontWeight.normal

                           ),
                           
                           decoration: InputDecoration(
                             hintText:"Password",
                            
                             border:InputBorder.none,
                             filled:true,
                             fillColor: Colors.grey[300],
                             contentPadding: EdgeInsets.all(8.0),
                            
                           ),
                         
                         ),
                          Padding(
                            padding: EdgeInsets.only(top:10,bottom: 8.0),
                            child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w800
                                ),
                              )
                            ]
                          ),
                          ),
                          MaterialButton(onPressed: (){
                              var uname= mycontroller1.text.toString();
                              var passw = mycontroller2.text.toString();
                              if(uname=="om"&& passw=="apple"){
                                   Fluttertoast.showToast(
                                      msg: uname,
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0
                                       );
                              }
                                
                              
                            
                          },
                          minWidth: 300,           
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),       
                          padding: EdgeInsets.symmetric(
                            vertical:13.0
                          ),
                          color: Colors.pink[400],                      
                          child:Text("Login",
                          style:TextStyle(
                            fontSize: 13.0,
                            
                            fontWeight: FontWeight.normal,
                            color: Colors.white))
                          ),

                       ],
                    ),
                    ),
                    ),
                  ],
                
               
               ),
            ],
          ),
        ],
      ),);
      
    
  }
}
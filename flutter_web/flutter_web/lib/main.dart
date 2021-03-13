import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_web/Questions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  int increment = 0;
  bool isVisible = false;
  bool isVisible2 = false;
  bool trueB  = false;
  bool textVisible = true;
  int _score = 0;
  bool scoreV = false;
  int _count_next=0;
  bool falseB = false;
 List questionBank = [
 Question.name("1. 2 +2 is 4", true),
 Question.name("2. The Prime Minister of India from 2014 is Narendra Modi.", true),  
 Question.name("3. The Present Chief  Minister of West Bengal is Mamata Banerjee.", true),
  Question.name("4. The Present Chief  Minister of West Bengal is Dilip Ghosh.", false),
 Question.name("5. South Africa is one of the Super Power in the world.", false),
 Question.name("6. Tata Consultancy services is one of the leading tech consultancy services in the world.", true),
 Question.name("7. The richest person of the world is the owner of tesla company and Spacex.", true),
 Question.name("8. India is going to lead the world in terms of gdp in the coming 20  years.", false),
 Question.name("9. Sunder Pichai is the person who introduces the concept of google drive and also made it.", true),
 Question.name("10. Tesla is not the most valuable company in the year 2020.", false),






 ];
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey.shade300,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
               Image.asset('assets/Quiz.jpg',),
               Padding(padding:EdgeInsets.all(10.0)),
               Container(
                 height:400,
                 width:MediaQuery.of(context).size.width,
                 decoration: BoxDecoration(
                   color: Colors.grey.shade300,
                   borderRadius: BorderRadius.all(Radius.circular(16))
                 ),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Center(child: Text(questionBank[increment].question,style: TextStyle(
                       fontSize: 20,
                       color: Colors.grey[600],
                       fontWeight: FontWeight.bold
                     ),)),
                     Padding(padding: EdgeInsets.only(top:70)),
                     Padding(
                       padding: const EdgeInsets.only(left:20.0,right:20),
                       child: Divider(height:5,color:Colors.amber),
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [Colors.green[300],Colors.blue[300]],),

                              color:Colors.orange.shade500,
                              borderRadius: BorderRadius.all(Radius.circular(30))
                          ),
                          child: TextButton(onPressed: (){
                            _dec();
                            textVisible = false;
                            scoreV = true;
                            isVisible=false;
                            isVisible2= false;
                          }, child: Text("PREV",style: TextStyle(
                           color: Colors.white
                         ),))),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                         gradient: LinearGradient(colors: [Colors.red[500],Colors.pink[300]],),

                              color:Colors.blue.shade500,
                              borderRadius: BorderRadius.all(Radius.circular(30))
                          ),
                          child: TextButton(onPressed: (){
                            textVisible = false;
                                trueB = false;
                                scoreV = true;
                                falseB = true;
                                setState(() {                   if( questionBank[increment].isCorrect==false) {
                                                                   _score ++;
                                                                isVisible = !isVisible;
                                                                isVisible2 = false;}
                                                                else{
                                                                  _score--;
                                                                  isVisible2 = !isVisible2;
                                                                  isVisible = false;
                                                                }   } );
                           
                          }, child: Text("False",style: TextStyle(
                           color: Colors.white
                         ),))),
                       Container(
                          height: 60,
                          width: 60,
                         decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Colors.indigo[300],Colors.blue[300]],),

                           color: Colors.blue.shade500,
                           borderRadius: BorderRadius.all(Radius.circular(30))
                         ),
                         child: TextButton(onPressed: (){
                           
                           textVisible = false;
                           scoreV = true;
                           
                           setState(() { 
                           
                              if( questionBank[increment].isCorrect==true) {
                                isVisible = !isVisible;
                                                _score++;
                                                trueB = false;
                                            isVisible2 = false;}
                                              else{
                                                _score--;
                                                falseB = false;
                                              isVisible2 = !isVisible2;
                                              isVisible = false;
                                                  }
                                                                       
                                                    });
                                                     
                         }, 
                        
                         child: Text("True",style: TextStyle(
                           color: Colors.white
                         ),)),),
                         Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                             gradient: LinearGradient(colors: [Colors.red[300],Colors.pink[300]],),

                              color:Colors.green.shade500,
                              borderRadius: BorderRadius.all(Radius.circular(30))
                          ),
                          child: TextButton(onPressed: (){
                            _inc();
                            _count_next++;
                            textVisible = false;
                            scoreV = true;
                            isVisible=false;
                            isVisible2= false;
                          }, child: Text("NEXT",style: TextStyle(
                           color: Colors.white
                         ),))),


                       ],

                     ),
                     Padding(
                       padding: const EdgeInsets.only(left:20,right:20),
                       child: Divider(height:5,color:Colors.amber),
                     ),
                     Padding(padding: EdgeInsets.only(top:20)),
                     correct(),
                    incorrect(),
                    Visibility(
                      visible: textVisible,
                      child: Text("Lets Begin",style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.normal
                      ),),
                    ),
                    Padding(padding: EdgeInsets.only(top:30)),
                    Visibility(
                      visible: scoreV,
                      child: Container(
                        height: 90,
                        width:350,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color:Colors.grey[350],
                          borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: 
                        
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Your Score: ",style: TextStyle(
                                color: Colors.blue.shade600,
                                fontSize: 17,
                              ),),
                              Container(
                                width: 90,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.grey[500],
                                  borderRadius: BorderRadius.all(Radius.circular(80))
                                ),
                                child: Text("$_score/10 ",style: TextStyle(
                                  color: Colors.greenAccent,
                                  fontSize: 28,
                                ),),
                              ),

                            ],
                          )
                      ),
                    )

                   ],
                 )
                 
               ),
              ],
            ),
          ),

        ),
      ),
    );
  }
  Widget correct(){
     return 
       Visibility(
         visible: isVisible,
         child: Container(
                         
                         height:60,
                         width:150,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           color: Colors.green[100],
                           gradient: LinearGradient(colors: [Colors.indigo[300],Colors.pink[300]],),
                         ),
                         child: 
                           Row(

                          mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Icon(Icons.check_sharp,size:26,color: Colors.green.shade600,),
                             Text('  Correct',style:TextStyle(
                               color: Colors.grey[200],
                               fontSize: 16,
                               
                             ))]
                         )),
       );
     
  }
  Widget incorrect(){
    return  Visibility(
      visible: isVisible2,
      child: Container(
                         
                         height:60,
                         width:150,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           color: Colors.green[100],
                           gradient: LinearGradient(colors: [Colors.indigo[300],Colors.pink[300]],),
                         ),
                         child: 
                          Row(

                          mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Icon(Icons.cancel_sharp,size:26,color: Colors.red.shade500,),
                             Text('  Incorrect',style:TextStyle(
                               color: Colors.grey[200],
                               fontSize: 16,
                               
                             ))]
                         )
                       ),
    );
                   

                  
                   


                 
              
               
             
    
  }

  
  _inc(){
     setState(() {
                increment = (increment+1)%questionBank.length;

          });
  }
  _dec(){
     setState(() {
          
                increment = (increment-1)%questionBank.length;
              
          });
  }
  _checkAnswer(bool check){
     if(check == questionBank[increment].isCorrect){
       return true;
     }
     else{
       return false;
     }

  }
}

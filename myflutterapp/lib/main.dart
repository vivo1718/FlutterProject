import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

void main() => runApp(myApp());
 
class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue
        
      ),
      home: MyHomePage(),
                      );
                    }
                  
            }
class  MyHomePage extends StatefulWidget{

  @override  
   MyHomePageState createState()=>MyHomePageState();
   
}    
class MyHomePageState extends State<MyHomePage>{
  int firstName,secondName;String textToDisplay="",res,operatorToPerform;

  void btnClicked(String btnVal){
    if(btnVal=="C"){
      textToDisplay= "";
      firstName=0;
      secondName=0;
      res=""; 
    }
    else if(btnVal=="+"||btnVal=="-"||btnVal=="/"||btnVal=="x"){
           firstName = int.parse(textToDisplay);
           res = "";
           operatorToPerform = btnVal;
    }
    else if(btnVal== "="){
      secondName = int.parse(textToDisplay);
      if(operatorToPerform == "+"){
        res = (firstName+secondName).toString();
      }
      if(operatorToPerform == "-"){
        res = (firstName-secondName).toString();
      }if(operatorToPerform == "/"){
        res = (firstName/secondName).toString();
      }if(operatorToPerform == "x"){
        res = (firstName*secondName).toString();
      }
    }
    else{
      res = int.parse(textToDisplay+btnVal).toString();

    }
    setState(() {
      textToDisplay = res;
    });

  }
  Widget custombutton(String btnValue){
     return Expanded(
       child: OutlineButton(
         highlightedBorderColor: Colors.blue,
        padding: EdgeInsets.all(25.0),

         onPressed:()=> btnClicked(btnValue),
         child: Text("$btnValue",
         style: TextStyle(
           fontSize: 25.0
           
           ),
         ),

       ),
     );
   }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title:Text('Calculator',
      ),
      backgroundColor: Colors.grey,
      elevation: 0,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children:<Widget>[
            Expanded(
              child:Container(
                decoration: BoxDecoration(color: Colors.grey),
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  "$textToDisplay",
                  style: TextStyle(fontSize: 30.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ),
            Container(
             // padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.green)
              ),
              child: Row(
                children:<Widget>[
                 custombutton("9",),
                custombutton("8"),
               custombutton("7"),
               custombutton("+"),

                ],
                                    
              ),
            ),
            Container(
              decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Colors.green)

              ),
              child: Row(
                children:<Widget>[
                 custombutton("6"),
                custombutton("5"),
               custombutton("4"),
               custombutton("-"),

                ],
                                    
              ),
            ),Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Colors.green)

              ),
              child: Row(
              children:<Widget>[
                 custombutton("3",),
                custombutton("2"),
               custombutton("1"),
               custombutton("x"),

                ],
                                    
              ),
            ),Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.green)
              ),
              child: Row(
                children:<Widget>[
                 custombutton("C"),
                custombutton("0"),
               custombutton("="),
               custombutton("/"),

                ],
                                    
              ),
            ),
          ],
        ),
      ),
    );
  }
}
      


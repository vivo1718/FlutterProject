import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_front_end/User.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'Signin.dart';
import 'mainScreen.dart';
class Signup extends StatefulWidget {
  const Signup({ Key? key }) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
final _emails = TextEditingController();
    final _passS = TextEditingController();
  final _confS = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  Future <User>save(String email,String password)async{
    var res = await http.post(Uri.parse("http://localhost:8080/signup"),
    headers:<String,String>{
      'Content-Type': 'application/json; charSet=UTF-8'
    },
    body:jsonEncode(<String,String>{
      'email':email,
      'password':password
    })
    );
    print(res.body);
    if (res.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));

    return User.fromJson(jsonDecode(res.body));

  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }

    
  }
 // User user =  User('','');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Signin()));
          },
          child: Container(
            
            child: Icon(CupertinoIcons.back,color: Colors.indigo,))),
        backgroundColor: Colors.white12
        
      ),
      body: Stack(
        //overflow: Overflow.clip,
        children: [
         /* Positioned(
            top:0,
            child:SvgPicture.asset('images/wave.svg',
            width: 400,
            height:120,)
            ),*/
          Container(
            
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 120,left: 25,right:25),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Hello user,Please SignUp',
                    textAlign: TextAlign.left
                    ,style: GoogleFonts.pacifico(
                      fontSize: 21,
                      color: Colors.indigo
                    ),
                    ),
                   // Divider(height: 4,),
                    SizedBox(height:25),
                    TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,

                      controller: _emails,
                     // textAlign: TextAlign.center,
                     validator: (value){
                      if(value!.isEmpty){
                        return "Enter your email";
                      }
                      else if(
                            RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                              return null;
                      }
                      else{
                        return 'Enter valid email id';
                      }
                    },
                      decoration: InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.paperplane,size: 18,),
                        hintText: 'Enter Your Mail Id..',
                        hintStyle: TextStyle(fontStyle: FontStyle.italic,fontSize: 15),
                        labelStyle: TextStyle(color: Colors.white),
                       
                        enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigoAccent)
                      
                        ,
                        
                        ),focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigoAccent),
                          
                      ),
                      ),
                    ),
                    SizedBox(height:25),
                    TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,

                      controller: _passS,
                      validator: (value){
                      if(value!.isEmpty){
                        return 'Enter something';
                      }
                      
                      else{
                        return null;
                      }
                    },
                      
                 // obscureText: true,
                      decoration: InputDecoration(
                        
                        prefixIcon: Icon(CupertinoIcons.padlock_solid,size: 18,),
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: 'Enter Your Password..',
                        
                        hintStyle: TextStyle(fontSize: 15,fontStyle: FontStyle.italic),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigoAccent),
                          
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigoAccent),
                          
                      ),
                      )
                    ),
                    SizedBox(height: 25,),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _confS,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please confirm your password';
                        }
                        else if(_passS.text==_confS.text){
                            return null;
                          }

                        
                        else{
                          return 'password didnt match';

                        }
                      },
                  obscureText: true,
                      decoration: InputDecoration(
                        
                        prefixIcon: Icon(CupertinoIcons.padlock_solid,size: 18,),
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: 'Confirm your Password..',
                        
                        hintStyle: TextStyle(fontSize: 15,fontStyle: FontStyle.italic),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigoAccent),
                          
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigoAccent),
                          
                      ),
                      )
                    ),
                    SizedBox(height:25),
                    InkWell(
                      onTap: (){
                        if(_formKey.currentState!.validate()){
                          save(_emails.text,_passS.text);

                        }
                        else{
                          print('not ok');
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.indigo,
                        child: Text('SignUp',style: GoogleFonts.pacifico(
                          fontSize:16,
                          color: Colors.white
                        ),),
                      ),
                    ),
                    SizedBox(height:25),
                  
                  
                      
                  ],
                ),
              ),
            ),
          )
          ],
      ),
    );
  }
}
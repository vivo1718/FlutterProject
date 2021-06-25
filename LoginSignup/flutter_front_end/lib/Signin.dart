import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

import 'Signup.dart';
import 'User.dart';
import 'mainScreen.dart';


class Signin extends StatefulWidget {
  const Signin({ Key? key }) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _emailC = TextEditingController();
  final _passC = TextEditingController();
  final snackbar = SnackBar(padding: EdgeInsets.only(left: 25,right:25,),
    backgroundColor: Colors.red,
    content: Text('Invalid Email',style: GoogleFonts.pacifico(),));
  final _formKey = GlobalKey<FormState>();
  Future <User>save(String email,String password)async{
    var res = await http.post(Uri.parse("http://localhost:8080/signin"),
    headers:<String,String>{
      'Content-Type': 'application/json;charSet=UTF-8'
    },
    body: jsonEncode(<String,String>{
      'email':email,
      'password':password
    })
  
    
    );
    //print(res.body);
    if (res.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    if(jsonDecode(res.body)!=null){
    Navigator.push(context, MaterialPageRoute(builder: (context,)=>MainScreen()));
    
    }
    else{

      //print('Data inside is null');
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _formKey,
                
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Welcome User Please SignIn',
                    textAlign: TextAlign.left
                    ,style: GoogleFonts.pacifico(
                      fontSize: 21,
                      color: Colors.indigo
                    ),
                    ),
                   // Divider(height: 4,),
                    SizedBox(height:25),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                       validator: (value){
                        if(value!.isEmpty){
                          return "Enter ypur email";
                        }
                        else if(
                              RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                                return null;
                        }
                        else{
                          return 'Enter valid email id';
                        }
                      },
                      controller: _emailC,
                      
                      
                     // textAlign: TextAlign.center,
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
                      keyboardType: TextInputType.text,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter something';
                        }
                        
                        else{
                          return null;
                        }
                      },
                      controller: _passC,
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
                    InkWell(
                      onTap: (){
                        if(_formKey.currentState!.validate()){
                            save(_emailC.text,_passC.text);

                        }
                        else{
                        print('not ok');
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.indigoAccent,
                        child: Text('SignIn',style: GoogleFonts.pacifico(
                          fontSize:16,
                          color: Colors.white
                        ),),
                      ),
                    ),
                    SizedBox(height:25),

                  InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
                  },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                       // color: Colors.indigoAccent,
                        child: Text('Dont have an account?Create one.',style: GoogleFonts.pacifico(
                          fontSize:16,
                          color: Colors.grey.shade500
                        ),),
                      ),
                    ),
      
                  ],
                ),
              ),
            )
            ],
        ),
      )

    );
  }
}
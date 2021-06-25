import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_front_end/Signin.dart';
import 'package:google_fonts/google_fonts.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white12,
        elevation: 0,
        leading: InkWell(
          onTap: (){    Navigator.push(context, MaterialPageRoute(builder: (context)=>Signin()));
},
          child: Container(child: Icon(CupertinoIcons.back,color: Colors.indigo,))),
      ),
      body: Center(
        child: Container(
          child: Text('Welcome to dashboard',style: GoogleFonts.pacifico(
            color: Colors.indigo,
            fontSize: 18
          )),
          
        ),
      ),
    );
  }
}
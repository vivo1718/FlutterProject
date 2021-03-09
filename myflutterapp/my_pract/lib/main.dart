import 'package:flutter/material.dart';


void main(){runApp(myApp());
}
class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "LoginUi",
      theme: ThemeData(
        primarySwatch:Colors.red
      ),
      home: HomePage(),

      
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:<Widget>[
          Image.asset("assets/boybehind.webp",
          fit: BoxFit.cover,)
        ],
      ),
      
    );
  }
}

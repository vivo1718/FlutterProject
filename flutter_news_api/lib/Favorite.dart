import 'package:flutter/material.dart';
class Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          width: double.infinity,
          color: Colors.green,
          child: Text('Entered'),
        ),
      ),
      
    );
  }
}
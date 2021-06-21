import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'UserData.dart';
 class BottomSheetWidget extends StatefulWidget {
   const BottomSheetWidget({ Key? key }) : super(key: key);
 
   @override
   _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
 }
 
 class _BottomSheetWidgetState extends State<BottomSheetWidget> {
   @override
   var getd;
   Future<UserData>getData()async{
    var data = await http.get(Uri.parse("https://fakeface.rest/face/json"));
    var jsonData = jsonDecode(data.body);
    print(jsonData);
    getd = jsonData["image_url"];
    return jsonData;
    
  }
  
   Widget build(BuildContext context) {
     return Container(
       height: 183,
       padding: EdgeInsets.all(12.0),
       decoration: BoxDecoration(
         color: Colors.white,
         
         borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))

       ),
       child: FutureBuilder(
         future:getData(),
         builder:(BuildContext context,AsyncSnapshot snapshot){
           return  Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Center(
               child: Container(
                 height:4,
                 decoration: BoxDecoration(
                 color: Colors.grey,
                 borderRadius: BorderRadius.all(Radius.circular(20))
                 ),
                 width:40
               ),
             ),
             Text('Search Contacts',
             style: TextStyle(fontWeight: FontWeight.bold),
             ),
             Padding(
               padding: EdgeInsets.only(left:15,right: 15 ),
               child: TextFormField(
                 
                 decoration:InputDecoration(
                   suffixIcon: Icon(Icons.content_paste,
                   size: 17,
                   color: Colors.deepPurpleAccent,),
                   
                   hintText: 'Select Number',
                   labelStyle: TextStyle(
                     color: Colors.deepPurpleAccent
                   ),
                   
                   hintStyle: TextStyle(
                     fontWeight: FontWeight.w500,
                     fontSize: 13
                   )
                 ) ,
               ),
               
               
             ),
             SizedBox(height: 15,),
             Padding(
               padding: const EdgeInsets.only(left:15.0),
               child: Row(children: [
                 CircleAvatar(
                   backgroundImage: NetworkImage(getd),
                   radius: 25,
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left:12.0),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                     
                     Text('Amerin Merkel',style: TextStyle(
                       fontSize: 13,
                       fontWeight:FontWeight.bold
                     ),),
                     Text('7694803783',style: TextStyle(
                       fontSize: 10,
                       fontWeight:FontWeight.w500
                     ),)
                   ],),
                 )
               ],),
             )
           ],
         );
           }
           )
          
       
       
     );
   }
 }
 
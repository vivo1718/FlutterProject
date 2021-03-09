//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'dart:io';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/views/category_news.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';


import 'article_view.dart';
class NewsApp extends StatefulWidget {
  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  List<CategoryModel> categories =  List<CategoryModel>();
  List<ArticleModel> articles = List<ArticleModel>();
  bool _loading = true;
  CategoryTile s = new CategoryTile();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getNews();
    
  }
    void getNews()async{
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: AppBar(
        
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue,Colors.green],
            begin: Alignment.topLeft,
            end:Alignment.bottomRight
            ),
           ),
        ),
        actions: [
           IconButton(
              onPressed: (){
                showModalBottomSheet<void>(
                  isScrollControlled: true,
                  context:context, 
                  builder: (BuildContext context){
                    return 
                      
                      
                       Container(
                          height: 250,
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(borderRadius:BorderRadius.circular(0),color: Colors.black,
),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment:CrossAxisAlignment.start,
                              children: [
                              Row(
                                children: [
                                  Padding(
                                 padding: const EdgeInsets.all(5),
                                      ),
                                  Icon(Icons.account_box_outlined,color: Colors.pink[800],),
                                  Padding(
                                padding: EdgeInsets.all(2),
                                    ),
                               
                               
                               
                                 TextButton(child: Text('About Us',
                                  style: TextStyle(color: Colors.grey[600] ,fontSize: 18),),
                                  onPressed: (){},
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                 padding: const EdgeInsets.all(5),
                                      ),
                                  Icon(Icons.rate_review_rounded,color: Colors.red[800],),
                                  Padding(
                                padding: EdgeInsets.all(2),
                                    ),
                               
                               
                               
                                 TextButton(child: Text('Rate Us',
                                  style: TextStyle(color: Colors.grey[600] ,fontSize: 18),),
                                  onPressed: (){},
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                 padding: const EdgeInsets.all(5),
                                      ),
                                  Icon(Icons.policy_outlined,color: Colors.green[800],),
                                  Padding(
                                padding: EdgeInsets.all(2),
                                    ),
                               
                               
                               
                                 TextButton(child: Text('Term And Policy',
                                  style: TextStyle(color: Colors.grey[600] ,fontSize: 18),),
                                  onPressed: (){},
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                 padding: const EdgeInsets.all(5),
                                      ),
                                  Icon(Icons.share,color: Colors.blue[800],),
                                  Padding(
                                padding: EdgeInsets.all(2),
                                    ),
                               
                               
                               
                                 TextButton(child: Text('Share App',
                                  style: TextStyle(color: Colors.grey[600] ,fontSize: 18),),
                                  onPressed: (){},
                                  )
                                ],
                              ),




                            ],),
                            Padding(
                              padding: const EdgeInsets.all(40.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                Text('F',style: TextStyle(color: Colors.white60,fontSize: 40)),

                                Text('N',style: TextStyle(color: Colors.blue[800],fontSize: 40),)
                              ],),
                            )
                          ],
                        ),

                    );
                      
                  }
                  );
                              },
              icon: Icon(Icons.settings,color: Colors.white,),
              ),
          
        ],
        backgroundColor: Colors.black,
        title:Row(
          children: [
          Text('Flutter',style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white),),
          Text('News',style:TextStyle(color:Colors.white,fontWeight: FontWeight.bold)),
          
        ],),
        elevation: 0.0,
      ),


      body: SingleChildScrollView(
              child: Container(
          
          child: Column(children:[
            Container(
              height: 200,
              margin: const EdgeInsets.only(top:5),
              padding: const EdgeInsets.only(left:10,right: 10),
              
              

              
              
              child: ListView.builder(
                itemCount: categories.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index){
                  return CategoryTile(
                    imageUrl:categories[index].imageUrl, 
                    categoryName:categories[index].categoryName,);
                }),
            ),
              
              
               Container(

                   padding: EdgeInsets.only(top:15,left:5,right:5),
                   child: ListView.builder(
                    shrinkWrap: true,
                    //scrollDirection: Axis.vertical,
                    physics: ClampingScrollPhysics(),
                    itemCount: articles.length,
                    itemBuilder: (context,index){
                      return BlogTitle(
                        imageUrl: articles[index].urlToImage, 
                        title: articles[index].title,
                        description:articles[index].description , 
                        author: articles[index].author,
                        url:articles[index].url,
                        );
                    }),
                 ),
              
          ],),
        ),
      ),
    );
  }
}

class ShimmerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('F',style:TextStyle(color:Colors.grey),),
          Text('N',style: TextStyle(color:Colors.orange[800]),)
        ],
      )
    );
    
  }
}
class CategoryTile extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final String imageUrl, categoryName;
  CategoryTile({this.imageUrl,this.categoryName});
  bool _load = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute<void>(
          builder:(context)=> CategoryNews(
            
            category: categoryName.toLowerCase(),)
          )
          );
      },
      
          child: Container(
        decoration: BoxDecoration(
              border: Border.all(color: Colors.green[800],width: 1.5),
              borderRadius:BorderRadius.circular(10),
            
            ),
        margin: EdgeInsets.only(right:10),
        child: Stack(children: [
        
           ClipRRect(
             child: FadeInImage.assetNetwork(
                  width: 120,
                  height: 200,
                  placeholder: 'assets/giphy4.gif',
                  placeholderCacheHeight: 20,
                  placeholderCacheWidth: 20,
                  fit: BoxFit.cover,
                  image:imageUrl ,

                  ),),
          Container(
            height: 200,
            width: 120,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 7),
            child: Text(categoryName,style: TextStyle(color:Colors.redAccent[400],fontSize: 14,fontWeight: FontWeight.bold),),
          ),
          
        ],),
        
      ),
    );
  }
  
}
class BlogTitle extends StatelessWidget {
  final String imageUrl,title,description,dateTime,author,url;
  BlogTitle({@required this.imageUrl,@required this.title,@required this.description,@required this.dateTime,@required this.author,@required this.url});

  @override
  Widget build(BuildContext context) {
    return
           
           GestureDetector(
             onTap: (){
               
               Navigator.push(context, MaterialPageRoute<void>(
                 builder: (context)=>Article(
                   blogurl: url,

                 )
                 )
                 );
             },
                        child: Container(
        decoration: BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.only(
              topLeft:Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft:Radius.circular(10),
              bottomRight: Radius.circular(10) ),
              border: Border.all(color:Colors.orange[800],width: 1.5)),

        margin:EdgeInsets.only(bottom:15),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[
                ClipRRect(child: FadeInImage.assetNetwork(
                  height: 180,
                  placeholder: 'assets/giphy4.gif',
                  image:imageUrl ,

                  fit:BoxFit.fill),
                
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)
                  ),
                  ),
              Padding(
                padding: const EdgeInsets.only(left:8.0,right:8,bottom:8,top:8),
                child: Text(title,style: TextStyle(fontSize:18,color: Colors.black87,fontWeight: FontWeight.bold),),
              ),
               Divider(height:5,color: Colors.grey[400],),
              Padding(
                padding: const EdgeInsets.only(left:8.0,bottom:8,right:8),
                child: Text(description,style: TextStyle(color:Colors.black54,fontSize: 14,fontWeight: FontWeight.bold),),
              ),
               Row(
                 
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child:  Container(
                       width: 180,
                       height: 30,
                       decoration: BoxDecoration(
                         color: Colors.grey[200],
                         borderRadius:BorderRadius.circular(10)
                       ),
                       child: Center(
                         
                           
                           child: AutoSizeText(author.toUpperCase(),style: TextStyle(color: Colors.red[800],),
                           maxLines: 1,
                           ),
                         
                       ),
                     )
                     ),
                     
                     Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         IconButton(
                           icon:Icon(Icons.card_giftcard) ,
                           onPressed: (){},
                           ),
                         IconButton(icon:Icon(Icons.share_outlined),
                         onPressed: (){},
                         ),
                         IconButton(icon:Icon(Icons.bookmark_border_outlined),
                         onPressed: (){},),

                       ],
                     )
                       
                       
                     ,
                   
                 ],
               ),
              
          ]
        ),
        
      
    ),
           );
  }
}
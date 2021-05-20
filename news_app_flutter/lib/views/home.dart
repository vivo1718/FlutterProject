import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'dart:io';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/views/category_news.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:share/share.dart';
import 'package:timeago/timeago.dart' as timeago;


import 'article_view.dart';
class NewsApp extends StatefulWidget {
  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> with TickerProviderStateMixin{
  List<CategoryModel> categories =  List<CategoryModel>();
  List<ArticleModel> articles = List<ArticleModel>();
  bool _loading = true;
  bool _scrollToTopB = false;
  
  BlogTitle bt = new BlogTitle();

  bool isVisible=false;
  ScrollController _scrollController;
  CategoryTile s = new CategoryTile();
  AnimationController animationController;
  final GlobalKey<ScaffoldState>_scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void dispose(){
    super.dispose();
    animationController.dispose();
    _scrollController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(duration: new Duration(seconds: 2),vsync: this);
    animationController.repeat();
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
  void _scrollToTop(){
    _scrollController.animateTo(0.0, duration: Duration(seconds: 2), curve: Curves.easeOut);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    
      key: _scaffoldKey,
      drawer:  ClipRRect(
        borderRadius: BorderRadius.only(topRight: Radius.circular(35),bottomRight:Radius.circular(35) ),
        child: Drawer(
          
          child: ListView(
          //  padding: EdgeInsets.all(10),
            children: [
              DrawerHeader(
                
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/bird.png'),
                    //  backgroundColor: Colors.white,
                    ),
                    Text('Flutter News',
                    style:TextStyle(fontSize: 20,color: Colors.grey[50]) ,),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.shade400
                ),

                ),
                Padding(padding: EdgeInsets.only(top:18,left:20,bottom:20 ),),
                ListTile(
                  leading: Icon(Icons.favorite_outline,),
                  title: Text('Favourites',
                  style:TextStyle(fontSize: 15,color: Colors.blueGrey) ,),
                  contentPadding: EdgeInsets.only(left:30,right: 30),
                  onTap: (){},
                ),
                Divider(),
                 ListTile(
                   leading: Icon(Icons.bookmark_outline,),
                  title: Text('Bookmark',style:TextStyle(fontSize: 15,color: Colors.blueGrey)),
                    contentPadding: EdgeInsets.only(left:30,right: 30),

                  onTap: (){},
                ),
                Divider(),
                 ListTile(
                   leading: Icon(Icons.share_outlined),
                  title: Text('Share App ',style:TextStyle(fontSize: 15,color: Colors.blueGrey)),
                     contentPadding: EdgeInsets.only(left:30,right: 30),

                  
                  onTap: (){},
                ),
                Divider(),
                 ListTile(
                   leading: Icon(Icons.rate_review_outlined),
                  title: Text('Rate Us',style:TextStyle(fontSize: 15,color: Colors.blueGrey)),
                   contentPadding: EdgeInsets.only(left:30,right: 30),

                  onTap: (){},
                ),
                Divider(),
                 ListTile(
                   leading: Icon(Icons.book_sharp),
                  title: Text('Terms And Policy',style:TextStyle(fontSize: 15,color: Colors.blueGrey)),
                     contentPadding: EdgeInsets.only(left:30,right: 30),

                  onTap: (){},
                ),
                Divider(),
                 ListTile(
                   leading: Icon(Icons.settings_outlined,),
                  title: Text('Settings',style:TextStyle(fontSize: 15,color: Colors.blueGrey)),
                     contentPadding: EdgeInsets.only(left:30,right: 30),

                  onTap: (){},
                ),
                Divider()

            ],
          )
              ),
      ),
        
      
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: AppBar(
        
        flexibleSpace: Container(
          
          decoration: BoxDecoration(
            color: Color(0xffeeeeee)
           ),
        ),
        actions: [
           IconButton(
              onPressed: (){
                              },
              icon: Icon(Icons.settings,color: Colors.blueAccent.shade200,),
              ),
          
        ],
        backgroundColor: Colors.black,
        centerTitle: true,
        title:Row(
          children: [
            
          Text('Flutter',style: TextStyle(fontWeight:FontWeight.bold,fontStyle: FontStyle.italic,color: Color(0xff3f51b5)),),
          Text('News',style:TextStyle(color:Colors.black,fontWeight: FontWeight.bold)),
          
        ],),
        elevation: 0.0,
      ),


      body: _loading?LinearProgressIndicator(
            backgroundColor: Colors.green,
           // valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),value: 0.25,
          ):SingleChildScrollView(
           controller: _scrollController,
              child: Container(
                
          
          child: Column(children:[
            Container(
              height: 200,
              margin: const EdgeInsets.only(top:5),
              padding: const EdgeInsets.only(left:10,right: 10),
              
              

              
              
              child: ListView.builder(
               // controller: _scrollController,
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
                   width: 400,
                   padding: EdgeInsets.only(top:15),
                   child: ListView.builder(
                   //  controller: _scrollController,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: ClampingScrollPhysics(),
                    itemCount: articles.length,
                    itemBuilder: (context,index){
                      return BlogTitle(
                        imageUrl: articles[index].urlToImage, 
                        title: articles[index].title,
                        description:articles[index].description , 
                        publish: articles[index].publishedAt,
                        author: articles[index].author,
                        source:articles[index].source,
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
            alignment: Alignment.center,
        decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(10),
                       

            
            ),
        margin: EdgeInsets.only(right:10),
      child: Stack(children: [
        
           ClipRRect(
             child: FadeInImage.assetNetwork(
                  width: 100,
                  height: 180,
                  placeholder: '',
                  placeholderCacheHeight: 20,
                  placeholderCacheWidth: 20,
                  fit: BoxFit.cover,
                  image:imageUrl ,

                  ),),
          Container(
            height: 180,
            width: 100,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 7),
            child: Text(categoryName,style: TextStyle(color:Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),
          ),
          
        ],),
        
      ),
    );
  }
  
}
class BlogTitle extends StatefulWidget {
  final String imageUrl,title,description,author,url,source;
  final String publish;
  

  int _count=0;
   
  BlogTitle({@required this.imageUrl,@required this.title,@required this.description,
  @required this.publish,
  @required this.author,@required this.url,@required this.source});

  @override
  _BlogTitleState createState() => _BlogTitleState();
}

class _BlogTitleState extends State<BlogTitle> {
  bool toggle = false;
  
    bool book_toggle = false;
   // String s =widget.publishedAt.substring(0,19);
    

  @override
  
  Widget build(BuildContext context) {
  // String s =widget.publishedAt.substring(0,19);
   // DateTime time = DateTime.parse(widget.publishedAt);

    return
           
           GestureDetector(
             onTap: (){
               
               Navigator.push(context, MaterialPageRoute<void>(
                 builder: (context)=>Article(
                   blogurl: widget.url,

                 )
                 )
                 );
             },
                        child: Container(
                        //  width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color:Color(0xffF9FBE7),
          borderRadius: BorderRadius.only(
              topLeft:Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft:Radius.circular(10),
              bottomRight: Radius.circular(10) ),
        ),

        margin:EdgeInsets.only(bottom:15),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(child: FadeInImage.assetNetwork(
                    height: 180,
                    placeholder: '',
                    
                    image:widget.imageUrl ,

                    fit:BoxFit.fill),
                  
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    ),
                    ),
                ),
              Padding(
                padding: const EdgeInsets.only(left:8.0,right:8,bottom:8,top:8),
                child: Text(widget.title,style: TextStyle(fontSize:18,color: Colors.grey[250],fontWeight: FontWeight.bold),),
              ),
               Divider(height:5,color: Colors.grey[400],),
              Padding(
                padding: const EdgeInsets.only(left:8.0,bottom:8,right:8),
                child: Text(widget.description+"...",style: TextStyle(color:Colors.black,fontSize: 14,fontStyle:FontStyle.italic),),
              ),
               SingleChildScrollView(
                 scrollDirection: Axis.horizontal,
                 child: Row(
                   
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         
                                  Padding(padding: EdgeInsets.only(left: 8)),
                                     InkWell(
                                       
                                       focusColor: Colors.yellow,
                                       hoverColor: Colors.yellow,
                                       highlightColor: Colors.yellow,
                                       child: AutoSizeText(widget.source.toUpperCase(),style: TextStyle(color: Color(0xff795548),fontWeight: FontWeight.bold,fontSize: 4),
                                       maxLines: 1,
                                       
                                   ),
                                     ),
                                   //Spacer(),
                                   Padding(padding: EdgeInsets.only(right: 10)),
                                 
                                 
                               
                               Container(
                                 alignment: Alignment.center,
                                 width: 90,
                                 child: Row(
                                   children: [
                                     Container(
                                       height: 5,
                                       width: 5,
                                       decoration: BoxDecoration(
                                         color: Colors.green,
                                         borderRadius: BorderRadius.circular(50)
                                       ),
                                     ),
                                     SizedBox(width: 5,),
                                     Text(timeUntil(DateTime.now()),style: TextStyle(
                                       color: Color(0xff3f51b5),
                                       fontSize: 10,
                                       fontWeight: FontWeight.bold
                                     ),),
                                   ],
                                 ),
                               ),
                       ],
                     ),
                     
                         
                          
                             
                               
                               
                                  
                               //Spacer(),
                             
                           
                         
                         
                     
                       
                       Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                         children: [
                        
                             
                              ClipOval(
                                child: Material(
                                  color: Color(0xffeeeeee),
                                  child: InkWell(
                                    onTap: (){
                                      setState(() {
                                               widget._count++;
                                              book_toggle = !book_toggle;          
                                                                    });
                                     
                                    },
                                   // splashColor: Colors.grey,
                                    child: 
                                     SizedBox(
                                       width: 50,
                                       height: 50,
                                       child: book_toggle?Icon(Icons.favorite,size:18,color: Colors.red,):Icon(Icons.favorite_outline,size:16,color: Color(0xff3f51b5)),)
                                    
                                     
                                     ),
                                ),
                              ),
                              
                       
                           ClipOval(
                                child: Material(
                                  color: Color(0xffeeeeee),
                                  child: InkWell(
                                    onTap: (){
                                      share(context, widget);
                                     
                                    },
                                   // splashColor: Colors.grey,
                                    child: 
                                     SizedBox(
                                       width: 50,
                                       height: 50,
                                       child: Icon(Icons.share,size:18,color: Color(0xff3f51b5),),)
                                    
                                     
                                     ),
                                ),
                              ),
                           ClipOval(
                                child: Material(
                                  color: Color(0xffeeeeee),
                                  child: InkWell(
                                    onTap: (){
                                      setState(() {
                                                            toggle = !toggle;          
                                                                    });
                                     
                                    },
                                   // splashColor: Colors.grey,
                                    child: 
                                     SizedBox(
                                       width: 50,
                                       height: 50,
                                       child: toggle?Icon(Icons.bookmark,size:18,color: Colors.green,):Icon(Icons.bookmark_border,size:16,color: Color(0xff3f51b5)),)
                                    
                                     
                                     ),
                                ),
                              ),

                         ],
                       )
                         
                         
                       ,
                     
                   ],
                 ),
               ),
              
          ]
        ),
        
      
    ),
           );
  }
  void share(BuildContext context,BlogTitle widget){
    final RenderBox box = context.findRenderObject();
    final String text = "${widget.title}-${widget.url}";
    Share.share(text,subject: widget.url,
    sharePositionOrigin:box.localToGlobal(Offset.zero)&box.size );
    
  }
  String timeUntil(DateTime date){
    return timeago.format(date,allowFromNow: true,locale:'en');
  }
}
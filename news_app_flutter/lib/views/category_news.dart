import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/views/article_view.dart';
import 'package:news_app/views/home.dart';
import 'package:share/share.dart';

class CategoryNews extends StatefulWidget {
  final String category;
  bool isloadCat=false;
  CategoryNews({this.category
  

  });

  @override
  _CategoryNewsState createState() => _CategoryNewsState(category);
}

class _CategoryNewsState extends State<CategoryNews> with SingleTickerProviderStateMixin {
     String category;
     var _scrollViewController = ScrollController();
     
     _CategoryNewsState(this.category);
    List<ArticleModel> articles = List<ArticleModel>();
    bool _loading = true;
   CategoryTile t = new CategoryTile();
    @override
    void initState() {
        // TODO: implement initState
        super.initState();
        getCategoryNews();
      }
      void getCategoryNews()async{
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading=false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:new NestedScrollView(
        floatHeaderSlivers: true,
       controller: _scrollViewController,
       physics: ScrollPhysics(parent: PageScrollPhysics()),
        headerSliverBuilder: (BuildContext context,bool innerBoxIsScrolled){
          return <Widget>[
            new SliverAppBar(
              centerTitle: true,
              elevation: 0.0,
              title: Text(category.toUpperCase(),style: TextStyle(
                color: Color(0xff3f51b5),
                fontSize: 16,
                
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic
              ), ),
              backgroundColor:Color(0xffeeeeee) ,
              pinned: false,
              floating: true,
              forceElevated: innerBoxIsScrolled,

            )
          ];
        }, 
        body:
        _loading?Column(
          children: [
            Center(
              child: LinearProgressIndicator(
                  backgroundColor: Colors.green,
                 // valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),value: 0.25,
                ),),
                
            
          ],
        ):
           SingleChildScrollView(
              child:Container(
              color: Colors.white,
              child: Column(children: [
                Container(
                          width: 400,
                         padding: EdgeInsets.only(left:12,right:12),
                         child: ListView.builder(
                          shrinkWrap: true,
                         scrollDirection: Axis.vertical,
                          physics: ClampingScrollPhysics(),
                          itemCount: articles.length,
                          itemBuilder: (context,index){
                            return BlogTitle(
                              imageUrl: articles[index].urlToImage, 
                              title: articles[index].title,
                              description:articles[index].description , 
                              author: articles[index].author,
                              source:articles[index].source,
                              url:articles[index].url,
                              );
                          }),
                       ),
              ],),
          ),
           ),
        ),
        
      
      

      
    );
  }
}
class BlogTitle extends StatefulWidget {
  final String imageUrl,title,description,author,url,source;
  DateTime publishedAt;
  BlogTitle({@required this.imageUrl,@required this.title,@required this.description,@required this.publishedAt,@required this.author,@required this.url,@required this.source});

  @override
  _BlogTitleState createState() => _BlogTitleState();
}

class _BlogTitleState extends State<BlogTitle> {
  bool toggle = false;
    bool book_toggle = false;

  @override
  Widget build(BuildContext context) {
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
        decoration: BoxDecoration(
          
                  color:Color(0xffeeeeee),

          borderRadius: BorderRadius.only(
              topLeft:Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)
              ),
             // border: Border.all(color:Colors.orange[800],width: 1.5)
              ),

        margin:EdgeInsets.only(bottom:15),
        
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[
                ClipRRect(child: FadeInImage.assetNetwork(
                  height: 180,
                  placeholder: '',
                  placeholderCacheHeight: 20,
                  placeholderCacheWidth: 20,
                  
                  image:widget.imageUrl ,

                  fit:BoxFit.fill),
                
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                 // bottomLeft: Radius.circular(10),
                 // bottomRight: Radius.circular(10)
                  ),
                  ),
              Padding(
                padding: const EdgeInsets.only(left:8.0,right:8,bottom:8),
                child: Text(widget.title,style: TextStyle(fontSize:18,color: Colors.black87,fontWeight: FontWeight.bold),),
              ),
               Divider(height:5,color: Colors.grey[400],),
              Padding(
                padding: const EdgeInsets.only(left:8.0,bottom:8,right:8),
                child: Text(widget.description,style: TextStyle(color:Colors.black,fontSize: 14,fontStyle: FontStyle.italic),),
              ),
               
                
                  SingleChildScrollView(
                 scrollDirection: Axis.horizontal,
                 child: Row(
                   
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     
                     
                        Padding(
                         padding: const EdgeInsets.all(8.0),
                         
                          
                             
                               
                               
                                 child: Container(
                                   
                                   width: 80,
                                   decoration: BoxDecoration(
                                     color: Colors.yellow,
                                     //border: Border.all(color: Colors.blue,width: 1.5),
                                   //  borderRadius: BorderRadius.all(Radius.circular(10))
                                   ),
                                  
                                     child: AutoSizeText(widget.source.toUpperCase(),style: TextStyle(color: Color(0xff795548),fontWeight: FontWeight.bold,fontSize: 4),
                                     maxLines: 1,
                                     ),
                                   ),
                                 ),
                                 
                               
                               Container(
                                 alignment: Alignment.center,
                                 width: 100,
                                 child: Text("4th April 15:15 hrs",style: TextStyle(
                                   color: Color(0xff3f51b5),
                                   fontSize: 10,
                                   fontWeight: FontWeight.bold
                                 ),),
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
}
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/views/article_view.dart';
import 'package:news_app/views/home.dart';

class CategoryNews extends StatefulWidget {
  final String category;
  CategoryNews({this.category
  

  });

  @override
  _CategoryNewsState createState() => _CategoryNewsState(category);
}

class _CategoryNewsState extends State<CategoryNews> {
     String category;
     
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
      extendBody: true,
      extendBodyBehindAppBar: true,
      
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 38,
        flexibleSpace: Container(

          decoration: BoxDecoration(
            
            gradient: LinearGradient(colors: [Colors.blue,Colors.green],
            begin: Alignment.topLeft,
            end:Alignment.bottomRight
            ),
           ),),
      
        centerTitle: true,
        title: 
          Text(category.toUpperCase(),style: TextStyle(fontWeight:FontWeight.bold,fontSize: 14,color: Colors.white),),


        ),
        
      
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(children: [
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
                  placeholderCacheHeight: 20,
                  placeholderCacheWidth: 20,
                  
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
                padding: const EdgeInsets.only(left:8.0,right:8,bottom:8),
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
                         color: Colors.grey[300],
                         borderRadius:BorderRadius.circular(10)
                       ),
                       child: Center(
                         child: AutoSizeText(author.toUpperCase(),style: TextStyle(color: Colors.red[800],fontSize: 14,),
                         maxLines: 1,
                         minFontSize: 14,
                         ),
                       ),
                     ),),
                     
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


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_api/AddItem.dart';
import 'package:flutter_news_api/Api_service.dart';
import 'package:flutter_news_api/Favorite.dart';
import 'package:provider/provider.dart';




import 'article_model.dart';
class mainPage extends StatefulWidget {
  
  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  ApiService client = ApiService();
  PageController pc ;
  int currentInd=0;
  
     bool _isRed=false;
     String nextItem ;

  
  bool _swapInd = false;
  @override
  void initState() {
    // TODO: implement initState
    pc = PageController(initialPage: currentInd);
    super.initState();
    //currentInd = 0;
  }

  void changePage(int index) {
    setState(() {
      currentInd = index;
    });
  }

  
  @override
  Widget build(BuildContext context) {
       //  bool _isRed=false;

    return Scaffold(
      backgroundColor:Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
       // backgroundColor: Colors.transparent,
        currentIndex: currentInd,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey[400],
      
        onTap: (index){
          this.pc.animateToPage(index, duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);
        },
        items: [
        BottomNavigationBarItem(
          backgroundColor: Colors.pinkAccent[600],
           
          icon:Icon(CupertinoIcons.list_bullet_indent),label: "News",),
          BottomNavigationBarItem(
            
            backgroundColor: Colors.pinkAccent[600],
         // activeIcon:Icon(CupertinoIcons.heart_fill,color: Colors.red,size:28,), 
         label: "Favorites",
          icon:Icon(CupertinoIcons.heart,),)
      
      ]),
      
     // backgroundColor: Colors.grey[300],
      body:Container(
        color: Colors.black,
        
        child: Column(
          children: [
            Expanded(
              child: PageView(
                
                onPageChanged: (index){
                  setState(() {
                                      currentInd=index;
                                    });
                                    return ;
                },
               // physics: new NeverScrollableScrollPhysics(),
                controller: pc,
                children:[ FutureBuilder(
                  future: client.getArticle(),
                  builder: (BuildContext context,AsyncSnapshot<List<Article>>snapshot){
                    if(snapshot.hasData){
                       List<Article>articles = snapshot.data;
                       

                       return Container(
                        // width: 200,
                        // width: 400,
                        // padding: EdgeInsets.all(10),
                         child: ListView.builder(
                            itemCount: articles.length,
                            itemBuilder: (context,index)=>
                                   HeartPage(
                                     title:articles[index].title,
                                     summary: articles[index].summary,
                                     date: articles[index].published,
                                   )
                                    
                                  
                                
                            
                         ),
                       );

                    }
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            backgroundColor: Colors.green,
                            strokeWidth: 1,
                            
                            
                            
                          ),
                          Padding(padding: EdgeInsets.only(top: 5)),
                          Text('Loading Please Wait',style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold),)
                        ],
                      ),
                    );
                    
                  },
                  
                  ),
                  Center(
                    child: Container(
                     // height: 100,
                     // width: 100,
                      color: Colors.black,
                      child: Consumer<AddItem>(
                        builder: (context,addItem,_){
                          return ListView.builder(
                            itemCount: addItem.itemList.length,
                          itemBuilder: (context,index){
                            return Container(
                              color: Colors.black,
                              child: ListTile(
                                leading: Icon(CupertinoIcons.heart_fill,color: Colors.blue,),
                                title: Text(addItem.itemList[index].title.toString(),style: TextStyle(color: Colors.white),),
                                subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(addItem.itemList[index].summary.toString(),style: TextStyle(color: Colors.grey),),
                                    Text(addItem.itemList[index].published.toString(),style: TextStyle(color: Colors.blue),),
                                    Divider(color: Colors.grey,)
                                  ],
                                ),
                              ),
                            );
                          });
                        },
                        
                      ),
                    ),
                  )
                  
                  ]
              ),
            ),

            Container(
              height: 0.2,
              width: double.infinity,
              color: Colors.grey[50],
            )

           
            
          ]),
      ) ,
    );
    
  }
  
}

class HeartPage extends StatefulWidget {
  final String title,summary,date;
  HeartPage({@required this.title,@required this.summary,@required this.date});
  
  @override
  _HeartPageState createState() => _HeartPageState();
}

class _HeartPageState extends State<HeartPage> {
  bool _isR = true;
  @override
  Widget build(BuildContext context) {
     return Container(
       
       child: Container(
         color: Colors.black,

         child: Column(
           children: [
             ListTile(
               
               leading: Container(
                 height: 50,
                 width: 50,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20)
                 ),
                 child: InkWell(
                   borderRadius:BorderRadius.circular(50) ,
                   splashColor: Colors.grey[150],
                   onTap: (){
                     setState(() {        
                                         _isR = !_isR;
                                                                     });
                           Provider.of<AddItem>(context,listen: false).addItem(widget.title,widget.summary,widget.date) ;
                   },
                   child:  Icon(_isR?CupertinoIcons.heart:CupertinoIcons.heart_fill,color: Colors.blue,size:24)
                 ),
               ),
                                                title: Text('${widget.title}',maxLines: 2,
                                                style: TextStyle(color: Colors.grey),
                                                overflow: TextOverflow.ellipsis,),
                                                subtitle: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(padding: EdgeInsets.only(top: 10)),
                                                    Text('${widget.summary}',
                                                    style: TextStyle(color: Colors.white38),
                                                    maxLines: 3,overflow: TextOverflow.ellipsis,),
                                                                                                  Padding(padding: EdgeInsets.only(top: 10)),

                                                    Text('${widget.date}',style: TextStyle(
                                                      fontSize: 13,
                                                      color:Colors.blue
                                                        
                                                      
                                                    ),),
                                                       Padding(padding: EdgeInsets.only(top: 10)),

                                                     Divider(color: Colors.grey,)

                                                  ],
                                                ),

             ),
            
           ],
         ),
       )
     );
           
        
  }
}
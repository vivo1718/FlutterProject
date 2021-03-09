import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    title: "Awesome App",
    home: HomePage(),
    theme: ThemeData(primarySwatch: Colors.purple),
  ),
  );
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    var myText = "Change My Name";
    TextEditingController ncontroller = TextEditingController();
    @override
    void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("AwesomeApp"),
      
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
                      child: Card(
                    
              child: Column(
              
                children:<Widget>[
                  
                  Image.asset("assets/photo-1452473767141-7c6086eacf42.webp",),
                  SizedBox(height:20,
                  ),
                  Text(myText,
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height:20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(26),
                    child: TextField(
                      controller: ncontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        
                        labelText: "Username",
                        hintText: "Enter Some Text"
                      ),
                    ),

                  ),
                  
                ],
              ),
            ),
          ),
        ),

      ),
        
    
    drawer: Drawer(
        child:ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          UserAccountsDrawerHeader(accountName: Text("OmTiwari"), 
          accountEmail: Text("omtiwarimaa92@gmail.com"),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage("https://images.unsplash.com/photo-1530244534845-4a0c319f41e3?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80"),
            ),
          ),
          ListTile(
            leading:Icon(Icons.person),
            title: Text("OM Tiwari"),
            onTap: (){},
            trailing: Icon(Icons.edit),
            ),
            ListTile(
            leading:Icon(Icons.email),
            title: Text("omtiwarimaa92@gmail.com"),
            trailing: Icon(Icons.edit),
            )

      ],
      ),
    
      
    ),
    
    
    floatingActionButton: FloatingActionButton(
      
    onPressed: (){
     // myText = ncontroller.text;
     
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 200,
                color: Colors.amber,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('Modal BottomSheet'),
                      ElevatedButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        
     // setState(() {
        
      });
    
    child: Icon(Icons.arrow_right_alt
    
    ),
    );
    return scaffold,
    );
  }
}
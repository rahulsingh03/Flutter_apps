import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:math';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme:ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  
  List<String> _todoItems = [];
  TextEditingController content = TextEditingController();
  bool isPressed = false;
  @override
  void initState(){
    content = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    content.dispose();
    super.dispose();
  }
  void _addTodoItem(String task) {
        if(task.length > 0) {
          setState(() => _todoItems.add(task));
        content.text='';
          }
  }
 
  Widget pageRoute(Color colors){
    return Scaffold(
        backgroundColor: colors,
        body: SafeArea(
          child: Column(
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back,color:Colors.black),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    ),
                    
                  trailing: IconButton(
                    
                    icon:Icon(Icons.turned_in_not_rounded,color:Colors.black),
                    onPressed: (){
                      _addTodoItem(content.text);
                      Navigator.pop(context);
                    },
                  ),
                ),  
                
                TextField(
                  autofocus: true,
                  // onSubmitted: (val) {
                  //   _addTodoItem(val);
                  //   Navigator.pop(context);
                  // },
                  maxLines:20,
                  controller:content,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Note',
                    contentPadding: const EdgeInsets.all(16.0)
                ),
              ),
            ],
          ),
            ), 
      );
    }

  Widget topCards({double gap=10.0, Color colors=Colors.grey, String text='So Silent',required Size size, required List list,required int index}){
        return GestureDetector(
              onTap: (){
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => MainCard(texts:text,colors:colors,todoItems:list,index:index)),
              );
              },
              child: Container(
                          width:150,
                          margin: EdgeInsets.only(right:gap,left:gap),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: colors,
                          ),
                          height: size.height/4,
                          child: Padding(
                            padding: EdgeInsets.all(gap),
                            child: Text(text,
                              style: TextStyle(
                              fontSize:16,
                              fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
        );
    }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar:AppBar(
            leading: Builder(
            builder: (BuildContext context) {
            return IconButton(
                icon: const Icon(Icons.waves_outlined,color: Colors.white,),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
             },
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search,color:Colors.white),
                onPressed: (){
                  setState(() {
                     TextField(
                       decoration: InputDecoration(border: InputBorder.none),
                     );
                  });
                  }
                ),
              IconButton(
                icon: Icon(Icons.person,color:Colors.white),
                onPressed: (){
                },
              ),
            ],
        ),
        drawer: AppDrawer(),
        body: SafeArea(
          child: Column(
              children:<Widget>[
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical:40,horizontal:0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      
                      for (String i in _todoItems.reversed.toList())
                        topCards(text:i,size:size,list:_todoItems,index:_todoItems.indexOf(i),colors:Colors.purple.shade700),
                      ],
                    ),
                  ),
                ),
              ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => pageRoute(Colors.grey.shade800)),
            );
          },
          tooltip: 'Add task',
          child: new Icon(Icons.add),
          backgroundColor:Colors.teal.shade200,
        ),
      );
  }
}

//AppDrawer
class AppDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     Widget listtile({String text='Calm Down',IconData icon= Icons.handyman,}){
    return ListTile(
          title: Text(text),
          leading: Icon(icon),
          horizontalTitleGap: 1.0,
          onTap:  (){Navigator.pop(context);}
    );
  }
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/drawerheader.jpg'),
                fit: BoxFit.cover,
            ),
          ),
          child: Stack(children: <Widget>[
          Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text("ToDo",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500))),
            ],
          ),
          ),
          listtile(text:'Contact',icon: Icons.contacts_rounded),
          listtile(text:'Person',icon: Icons.person),
          Divider(
            height: 5.0,
          ),
          listtile(text:'Complete',icon: Icons.domain_verification_sharp),
          listtile(text:'Incomplete',icon: Icons.dangerous),
         
        ],
      )
    );
  }
}

class MainCard extends StatefulWidget {
  
  final String texts;
  final Color colors;
  final List todoItems;
  final int index;
  MainCard({required this.texts,required this.colors,required this.todoItems,required this.index});

  @override
  _MainCardState createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> {

  TextEditingController editcontent = TextEditingController();

  @override
  void initState(){
    editcontent = TextEditingController(text:widget.texts);
    super.initState();
  }
  @override
  void dispose() {
    editcontent.dispose();
    super.dispose();
  }

  void editContent(){
      if (widget.texts != editcontent.text){
        widget.todoItems[widget.index] = editcontent.text;
      }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: widget.colors,
        body: SafeArea(
          child: Column(
              children: <Widget>[
                ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back,color:Colors.black),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    ),
                    
                  trailing: IconButton(
                    icon:Icon(Icons.turned_in_not_rounded,color:Colors.black),
                    onPressed: (){
                      editContent();
                      Navigator.pop(context);
                    },
                  ),
                ),  
                TextField(
                  decoration:InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(16.0),
                  ),
                  controller: editcontent,
                  maxLines: 20,
                ),
            ],
          ),
            ), 
      );
  }
}
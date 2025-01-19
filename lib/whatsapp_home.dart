import 'package:flutter/material.dart';
import 'package:flutter_ui_login/pages/call_screen.dart';
//import 'package:flutterwhatsapp/pages/camera_screen.dart';
import 'screen.dart';
import 'package:flutter_ui_login/pages/status_screen.dart';
import 'package:flutter_ui_login/page.dart';

class WhatsAppHome extends StatefulWidget {

 // WhatsAppHome(this.cameras);

  @override
  _WhatsAppHomeState createState() => new _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 1, length: 4);
  }

  void more(){
    new Scaffold(
      body: Column(
        children: <Widget>[
          InkWell(child: Text("Profile"),onTap: ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page())),)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("CHW: The Frontline"),
        elevation: 0.7,
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
           // new Tab(icon: new Icon(Icons.camera_alt)),
            new Tab(text: "FAMILIES"),
            new Tab(
              text: "TASKS",
            ),
            new Tab(
              text: "GUIDLINE",
            ),
          ],
        ),
        actions: <Widget>[
          new Icon(Icons.search),
          new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
          ),

         new IconButton(icon: new Icon(Icons.more_vert), onPressed: more,),
        ],
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          //new CameraScreen(widget.cameras),
          new ChatScreen(),
          new StatusScreen(),
          new CallsScreen(),
        ],
      ),

     /* floatingActionButton: new FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: new Icon(
          Icons.arrow_right,
          color: Colors.white,
        ),
        onPressed: () => print("open chats"),
      ),*/
    );
  }
}

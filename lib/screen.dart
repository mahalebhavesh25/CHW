import 'package:flutter/material.dart';
import 'models/chat_model.dart';
import 'page.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ui_login/whatsapp_home.dart';
//import 'package:flutter_ui_login/vital.dart';



class ChatScreen extends StatefulWidget {
  @override
  ChatScreenState createState() {
    return new ChatScreenState();
  }
}

class ChatScreenState extends State<ChatScreen> {
  int i=0;
Future getPosts() async {
  var firestore= Firestore.instance;
  QuerySnapshot vn =await firestore.collection("Patient").getDocuments();
  return vn.documents;
}

nav(DocumentSnapshot post)
{
  Navigator.push(context, MaterialPageRoute(builder: (context)=>Member(post:post)));
}



void sub(int i){
  /**/

  formKey.currentState.save();

  try {
    Map<String, String> data = <String, String>{
      "Name": name,

    };
 //   Map<String, Widget> tata =<String,Widget>{};
    // User user = User(name: _Name);
    final CollectionReference users = Firestore.instance.collection('Patient');
    Firestore.instance.runTransaction((Transaction transaction) async {
      Firestore.instance.collection('Patient').document("Family${i}").setData(data);

  i=i+1;

    },);

  } catch (e) {
    print(e.toString());
  }
}

  @override
  String name;

  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: new FloatingActionButton(
          backgroundColor: Theme.of(context).accentColor,
          child: new Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: (){showDialog(

              context: context,
              builder: (_) => new AlertDialog(
                title: new Text("Family"),
                content:
                Container(

                  //trailing: Container(
                  child: new Form(
                      key: formKey,
                      child: Column(
                          children: <Widget>[
                TextFormField(
                    decoration: new InputDecoration(
                        labelText: "Family Name",

                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),

                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                      onSaved:(val)=>name=val,
                ),

                  new RaisedButton(padding: EdgeInsets.only(
                      left: 35.0, top: 10.0, right: 35.0, bottom: 10.0),
                      child: new Text(
                        "Submit",
                        style: new TextStyle(color: Colors.blue, fontSize: 20.0),
                      ),
                      color: Colors.blue,

                      onPressed: ()=> sub(i))
                ],

                )
              )
          )
              )
          );}
        ),
      body:
       FutureBuilder(
        future: getPosts(),
        builder: (_,snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(
            child:Text("Loading..."),
          );
        }
        else
          {
            i=snapshot.data.length+1;
                return ListView.builder(
                  itemCount: snapshot.data.length,
                    itemBuilder: (_,i)=> new Column(
                      children: <Widget>[
                    new Divider(
                    height: 10.0,
                    ),
                    new ListTile(
                      title:Text(snapshot.data[i].data["Name"]),
                      onTap: ()=>nav(snapshot.data[i]),
                    )
                ]
                    )
                );

          }
      },
    )
    );
  }
}
/*
class Detail extends StatefulWidget {
  final DocumentSnapshot post;
  Detail({this.post});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> WhatsAppHome())),
        ),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 25.0, left: 10.0, right: 20.0)),
              Text(widget.post.data["Name"],style: TextStyle(fontSize: 30.0,color: Colors.black),),
              Text("Disease:  ${widget.post.data["Disease"]}",style: TextStyle(fontSize: 20.0,color: Colors.black54,),),
            ],
          )
      ),
    );
  }
}*/
String Doc1,Doc2;
DocumentSnapshot Doc3,Doc4;

class Member extends StatefulWidget {
  final DocumentSnapshot post;
  Member({this.post});
  @override
  _MemberState createState() => _MemberState();
}

class _MemberState extends State<Member> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Future getPosts() async {
    Doc1=widget.post.documentID;
    Doc3=widget.post;
    var firestore= Firestore.instance;
    QuerySnapshot vn =await firestore.collection("Patient").document(widget.post.documentID).collection("Members").getDocuments();
    return vn.documents;
  }

  navig(DocumentSnapshot post)
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Detail(post:post)));
  }

  void sub(int i){
    /*Navigator.push(context,
      MaterialPageRoute(builder: (context) => SignupPage()));*/

    formKey.currentState.save();

    try {
      Map<String, String> data = <String, String>{
        "Name": name,

      };
      //   Map<String, Widget> tata =<String,Widget>{};
      // User user = User(name: _Name);
      final CollectionReference users = Firestore.instance.collection('Patient');
      Firestore.instance.runTransaction((Transaction transaction) async {
        Firestore.instance.collection('Patient').document(widget.post.documentID).collection("Members").document("${i}").setData(data);

        i=i+1;

      },);

    } catch (e) {
      print(e.toString());
    }
  }
  @override
  String name;
  int i;
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: new FloatingActionButton(
            backgroundColor: Theme.of(context).accentColor,
            child: new Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: (){showDialog(

                context: context,
                builder: (_) => new AlertDialog(
                    title: new Text("Member"),
                    content:
                    Container(

                      //trailing: Container(
                        child: new Form(
                            key: formKey,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  decoration: new InputDecoration(
                                      labelText: "Member Name",

                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),

                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.green))),
                                  onSaved:(val)=>name=val,
                                ),

                                new RaisedButton(padding: EdgeInsets.only(
                                    left: 35.0, top: 10.0, right: 35.0, bottom: 10.0),
                                    child: new Text(
                                      "Submit",
                                      style: new TextStyle(color: Colors.blue, fontSize: 20.0),
                                    ),
                                    color: Colors.blue,

                                    onPressed: ()=> sub(i))
                              ],

                            )
                        )
                    )
                )
            );}
        ),
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> WhatsAppHome())),
        ),
      ),
        body:
        FutureBuilder(
          future: getPosts(),
          builder: (_,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(
                child:Text("Loading..."),
              );
            }
            else
            {
              i=snapshot.data.length+1;
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_,i)=> new Column(
                      children: <Widget>[
                        new Divider(
                          height: 10.0,
                        ),
                        new ListTile(
                          title:Text(snapshot.data[i].data["Name"]),
                          onTap: ()=>navig(snapshot.data[i]),
                        )
                      ]
                  )
              );

            }
          },
        )
    );
  }
}


class Detail extends StatefulWidget {
  final DocumentSnapshot post;
  Detail({this.post});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override

  void fam(){

    Doc2=widget.post.documentID;
    Doc4=widget.post;
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => button()));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
          backgroundColor: Theme.of(context).accentColor,
          child: new Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: fam,
      ),
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> WhatsAppHome())),
        ),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 25.0, left: 10.0, right: 20.0)),
              Text(widget.post.data["Name"],style: TextStyle(fontSize: 30.0,color: Colors.black),),
              Text("Disease:  ${widget.post.data["Disease"]}",style: TextStyle(fontSize: 20.0,color: Colors.black54,),),
            ],
          )
      ),
    );
  }
}



class SignupPage extends StatelessWidget {

  //
  @override

  Widget build(BuildContext context) {


    void val()
    {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WhatsAppHome()));
    }
    return new MaterialApp(
      theme: new ThemeData(
        accentIconTheme: IconThemeData(color: Colors.blue),


      ),
      home: new Scaffold(
       // floatingActionButton: FloatingActionButton(onPressed: val,child: Icon(Icons.arrow_back,color: Colors.red,),)

        appBar: new AppBar(
          title: new Center(
            child: Text('Form'),

          ),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.orange),
            onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> WhatsAppHome())),
          ),
        ),
        body: new ListView.builder(
          // new ListTile()

          itemBuilder: (BuildContext context, int index,) {
            return new StuffInTiles(listOfTiles[index],);
          },
          itemCount: listOfTiles.length,

        ),
      ),
    );

  }


}
final formKey = new GlobalKey<FormState>();


//String _Name,_surname,_Birth,_mob;
class StuffInTiles extends StatelessWidget {

  final MyTile myTile;


  String Collection = "Info";
  int BP,HR,RR,Temp;
  final nameController= TextEditingController();
  // final Yo yo;
  StuffInTiles(this.myTile);

DocumentReference qn;

  @override
  Widget build(BuildContext context) {


    return _buildTiles(myTile);
  }

  //int groupvalue;
  Widget _buildTiles(MyTile t) {
    if (t.title == "Add Vital Parameters") {
      return new ExpansionTile(

        //  key: new PageStorageKey<int>(0),
        title: new Text(t.title

        ),
        children: <Widget>[

          Container(

            //trailing: Container(
              child: new Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(

                        decoration: new InputDecoration(

                            labelText: "Blood Pressure",

                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),

                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        //onChanged: (value){this._Name=value;},
                        //controller: nameController,
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'Provide BP';
                          }
                        },
                        onSaved:(val)=>BP=num.tryParse(val),
                      ),
                      TextFormField(
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'Provide HR';
                          }
                        },
                        decoration: new InputDecoration(
                            labelText: "Heart rate",

                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),

                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green)))
                        , onSaved: (input) => HR = num.tryParse(input),
                      ),
                      TextFormField(
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'Provide Respiratory Rate';
                          }
                        },
                        decoration: new InputDecoration(
                            labelText: "Respiratory rate",

                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),

                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        onSaved: (input) => RR = num.tryParse(input),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'Provide Temperature';
                          }
                        },
                        decoration: new InputDecoration(
                            labelText: "Temperature",

                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),

                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        onSaved: (input) => Temp = num.tryParse(input),
                        keyboardType: TextInputType.number,
                      ),
                      new RaisedButton(
                        padding: EdgeInsets.only(
                            left: 35.0, top: 10.0, right: 35.0, bottom: 10.0),
                        child: new Text(
                          "Submit",
                          style: new TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                        color: Colors.blue,
                        onPressed: signUp ,
                        //  Navigator.of(context).pushNamed('/MyApp');


                      ),

                    ],
                  )
              )
          )
        ],
        //children: t.children.map(_buildTiles).toList(),
      );
    }
    else
      return ExpansionTile(title: Text(t.title),
        children: <Widget>[
          Container(
            child: Form(
               // key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 25.0, left: 10.0, right: 20.0)),
                   // Text("Dada"),
                    Text("Name:${Doc4.data["Name"]}",style: TextStyle(fontSize: 30.0,color: Colors.black),),
                    Text("Disease:${Doc4.data["Disease"]}",style: TextStyle(fontSize: 30.0,color: Colors.black),),
                    Text("BLOOD PRESSURE:${Doc4.data["Blood Pressure"]}",style: TextStyle(fontSize: 30.0,color: Colors.black),),
                    Text("HEART RATE:${Doc4.data["Heart Rate"]}",style: TextStyle(fontSize: 30.0,color: Colors.black),),
                    Text("RESPIRATORY RATE:${Doc4.data["Respiratory Rate"]}",style: TextStyle(fontSize: 30.0,color: Colors.black),),
                    Text("TEMPERATURE:${Doc4.data["Temperature"]}",style: TextStyle(fontSize: 30.0,color: Colors.black),),
                    ],
                )
            ),
          )

        ],
      );



  }
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  void signUp() async {
    //print(name);
    if (formKey.currentState.validate()) {
      formKey.currentState.save();

      try {
        Map<String, int> data = <String, int>{
          "Blood Pressure": BP,
          "Heart Rate": HR,
          "Respiratory Rate": RR,
          "Temperature": Temp,
        };
       // Map<String, Widget> tata =<String,Widget>{};
        // User user = User(name: _Name);
        final CollectionReference users = Firestore.instance.collection('Info');
        Firestore.instance.runTransaction((Transaction transaction) async {
          Firestore.instance.collection('Patient').document(Doc1).collection("Members").document(Doc2).updateData(data);


          // val();
          //await reference
          //    .add({"Name": _Name, "Mobile": _mob, "DOB": _Birth});
          /*
      Firestore.instance.runTransaction(
            (Transaction transaction) async {
          await Firestore.instance
              .collection(Collection)
              .document()
              .setData(user.tojson());*/
        },);

      } catch (e) {
        print(e.toString());

       // Doc1=widget.post.documentID;
        var firestore= Firestore.instance;
        DocumentReference vn =await firestore.collection("Patient").document(Doc1).collection("Members").document(Doc2);
          qn=vn;
      }
    }
  }
  @override
  Widget  buildbut(BuildContext context){
    void val()
    {

    }
  }
}





/*class Yo {
  TextFormField di;
  Yo(this.di);
}*/


class MyTile {
  String title;
  List<MyTile> children;

  MyTile(this.title,[this.children = const <MyTile>[]]);
}


List<MyTile> listOfTiles = <MyTile>[new MyTile(
  "Add Vital Parameters",


),
new MyTile(
  "Vital Parameters",


),



];


class button extends StatefulWidget {


  @override
  _buttonState createState() => _buttonState();
}

class _buttonState extends State<button> {

  @override
  Widget build(BuildContext context) {
    //doc='${widget.user.email}';

    return buil(context);

  }


  @override
  Widget buil(BuildContext context) {
    return new MaterialApp(
        home: SignupPage()
      /*Scaffold(



                body: Form(
                  //key: _formKey,

                    child: Column(
                        children: <Widget>[
                          Text("ndv"),
                          RaisedButton(

                            child: new Text(
                              "Home",
                              style: new TextStyle(color: Colors.white, fontSize: 10.0),
                            ),
                            color: Colors.blue,
                            onPressed: val ,
                            //  Navigator.of(context).pushNamed('/MyApp');


                          ),
                        ]

                    )
                ),


            ),



*/
    );

  }
}


/*final CollectionReference users = Firestore.instance.collection('users');
Firestore.instance.runTransaction((Transaction transaction) async {
CollectionReference reference =
Firestore.instance.collection('users');

await reference
    .add({"fullname": nameController.text, "PhoneNumber": phoneController.text, "adresse": adressController.text});
*/



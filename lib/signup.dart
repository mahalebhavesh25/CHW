/// ListTile

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'page.dart';
import 'package:flutter_ui_login/whatsapp_home.dart';
import 'main.dart';
import 'screen.dart';

void main() => runApp(new button());




String doc;
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
        floatingActionButton: FloatingActionButton(onPressed: val,child: Icon(Icons.arrow_right,color: Colors.red,),)
        ,
        appBar: new AppBar(
          title: new Center(
            child: Text('Form'),

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
  String name,_surname,_Birth, _mob;
final nameController= TextEditingController();
  // final Yo yo;
  StuffInTiles(this.myTile);



  @override
  Widget build(BuildContext context) {


    return _buildTiles(myTile);
  }

  //int groupvalue;
  Widget _buildTiles(MyTile t) {
    if (t.title == "Personal Detail") {
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

                labelText: "Name",

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
                return 'Provide an email';
              }
            },
            onSaved:(val)=>name=val,
          ),
          TextFormField(
            validator: (input) {
              if (input.isEmpty) {
                return 'Provide an email';
              }
            },
            decoration: new InputDecoration(
                labelText: "Surname",

                labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),

                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green)))
            , onSaved: (input) => _surname = input,
          ),
          TextFormField(
            validator: (input) {
              if (input.isEmpty) {
                return 'Provide an email';
              }
            },
            decoration: new InputDecoration(
                labelText: "BirthDate",

                labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),

                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green))),
            onSaved: (input) => _Birth = input,
            keyboardType: TextInputType.datetime,
          ),
          TextFormField(
            validator: (input) {
              if (input.isEmpty) {
                return 'Provide an email';
              }
            },
            decoration: new InputDecoration(
                labelText: "Mobile Number",

                labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),

                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green))),
            onSaved: (input) => _mob = input,
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
      return new ExpansionTile(
        //  key: new PageStorageKey<int>(0),
        title: new Text("Qualification"

        ),

        children: <Widget>[
          TextFormField(decoration: new InputDecoration(
              labelText: "Degree",

              labelStyle: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),

              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green)))
          ),

          new RaisedButton(
              padding: EdgeInsets.only(
                  left: 35.0, top: 10.0, right: 35.0, bottom: 10.0),
              child: new Text(
                "Submit",
                style: new TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              color: Colors.blue,
              onPressed: signUp
            //  Navigator.of(context).pushNamed('/MyApp');


          ),

        ],
        //children: t.children.map(_buildTiles).toList(),
      );


  }
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  void signUp() async {
    print(name);
    if (formKey.currentState.validate()) {
      formKey.currentState.save();

      try {
        Map<String, String> data = <String, String>{
          "Name": name,
          "Mobile": _mob,
          "DOB": _Birth,
        };
        Map<String, Widget> tata =<String,Widget>{};
        // User user = User(name: _Name);
        final CollectionReference users = Firestore.instance.collection('Info');
        Firestore.instance.runTransaction((Transaction transaction) async {
          Firestore.instance.collection('Info').document(doc).setData(data);


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
  "Personal Detail",


  ),
  new MyTile

  (
    "Qualification",
  ),


  ];


class button extends StatefulWidget {
  const button({Key key, this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  _buttonState createState() => _buttonState();
}

class _buttonState extends State<button> {

  @override
  Widget build(BuildContext context) {
    doc='${widget.user.email}';

    return buil(context);

  }
  void val(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page()));
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



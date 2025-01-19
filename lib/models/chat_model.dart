



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_login/screen.dart';


class ChatModel {
  final String name;


  ChatModel({this.name});
}
/*class term extends StatefulWidget {
  @override


  Future<List> getAllRecords(String dbTable) async {
    var dbClient = await ;
    var result = await dbClient.rawQuery("SELECT * FROM $dbTable");

    return result.toList();
  }
  _termState createState() => _termState();
}

class _termState extends State<term> {
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream: Firestore.instance.collection('Patient').snapshots(),
      builder: (context,snapshot){
        for(var i=0;i<dummyData.length;i++) {
          return Column(
            children: <Widget>[

            ],
          );
        }
      },),


    );
  }
}*/
//for(var i=0;i<3;i++>){}

List<ChatModel> dummyData = [
  new ChatModel(
      name: "",
      ),
  new ChatModel(
      name: "Harvey Spectre",
      ),
  new ChatModel(
      name: "Mike Ross",
      ),
  new ChatModel(
      name: "Rachel",
      ),
  new ChatModel(
      name: "Barry Allen",
      ),
  new ChatModel(
      name: "Joe West",
      ),
];

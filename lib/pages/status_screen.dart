import 'package:flutter/material.dart';
import '../models/chat_model.dart';

class StatusScreen extends StatefulWidget {
  @override
  StatusScreenState createState() {
    return new StatusScreenState();
  }
}

class StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
    body:
      new ListView.builder(
      itemCount: dummyData.length,
      itemBuilder: (context, i) => new Column(
        children: <Widget>[
          new Divider(
            height: 10.0,
          ),
          new ListTile(

            title: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  dummyData[i].name,
                  style: new TextStyle(fontWeight: FontWeight.bold),
                ),

              ],
            ),

          )
        ],
      ),
    )
    );
  }
}

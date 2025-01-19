
import 'package:flutter/material.dart';
import 'package:flutter_ui_login/screen.dart';
import 'status_screen.dart';
import 'package:flutter_ui_login/whatsapp_home.dart';




class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
              Text("Hello")
            ],
          )
      ),
    );
  }


}


import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'signup.dart';
import 'main.dart';
import 'register.dart';


class page extends StatefulWidget {
  @override
  _page createState() => _page();
}

class _page extends State<page> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  void dol()
  {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignupPage()));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: dol)
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text("Profile",style: TextStyle(fontSize: 12.0,color: Colors.blue))

            ],
          )
      ),
    );
  }


}

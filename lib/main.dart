import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:core';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter OAuth Demo',
      theme: new ThemeData.dark(),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {  
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {  

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new RaisedButton(
          child: new Text("Log in"),
          onPressed: () => authenticate(),
        ),
      ),
    );
  }

  authenticate() async {
  
    final String clientId = "25843db0-0ff3-4227-9ca5-2353a0de8a92";
    final String redirectUri = "com.atco.oauthdemo://oauth/redirect";
    final String scope = "User.Read";
    
    final url = Uri.parse(
      'https://login.microsoftonline.com/common/oauth2/v2.0/authorize'
      '?client_id=$clientId'
      '&response_type=code'
      '&redirect_uri=$redirectUri'
      '&response_mode=query'
      '&scope=$scope');

    if (await canLaunch(url.toString())) {
      await launch(url.toString());
    } else {
      throw 'Could not launch $url';
    }
  }
}

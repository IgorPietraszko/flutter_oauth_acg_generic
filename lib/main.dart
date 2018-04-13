import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  String _authorizationCode;

  static const platform = const MethodChannel('flutter_oauth_acg_generic/authorize');

  @override
  void initState() {
    platform.setMethodCallHandler((MethodCall call) {
      assert(call.method == "authorize");
      handleAuthenticationResult(call.arguments);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(        
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              child: new Text("Log in"),
              onPressed: () => authenticate(),
            ),
            new Text('$_authorizationCode')
          ],
        ),
      ),
    );
  }

  authenticate() async {

    // Wipro Programme Status Registration
    final String clientId = "11fcfedd-70a6-4e24-9970-82c641a61fd2";
    final String redirectUri = "msal11fcfedd-70a6-4e24-9970-82c641a61fd2://auth";
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

  void handleAuthenticationResult(String authorizationCode){
    setState(() {_authorizationCode = authorizationCode; });
  }
}

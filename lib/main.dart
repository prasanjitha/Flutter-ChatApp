import 'package:mainflutter/helper/authenticate.dart';
import 'package:mainflutter/helper/helperfunctions.dart';
import 'package:mainflutter/views/chatrooms.dart';
import 'package:flutter/material.dart';

import 'changes/sendData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool userIsLoggedIn;

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState() async {
    await HelperFunctions.getUserLoggedInSharedPreference().then((value){
      setState(() {
        userIsLoggedIn  = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterChat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff145C9E),
        scaffoldBackgroundColor:Colors.blueGrey ,
        accentColor: Color(0xff007EF4),
        fontFamily: "OverpassRegular",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:sendData(),
      //userIsLoggedIn != null ?  userIsLoggedIn ? ChatRoom() : Authenticate()
         // : Container(
        //child: Center(
        //  child: Authenticate(),
       // ),
     // ),
    );
  }
}

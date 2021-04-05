import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/UI/intraypage.dart';
import 'package:todoapp/models/constants.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            elevation: Platform.isIOS ? 0 : 5,
            leading: Icon(Icons.menu_sharp),
            actions: <Widget>[
              Icon(Icons.calendar_today),
              Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
              Icon(Icons.more_vert)
            ],
            title: Text("Home")),
        body: Stack(
          children: [
            TabBarView(
              children: [
                Container(
                  color: Colors.blue,
                ),
                Container(
                  color: Colors.grey,
                ),
                Container(
                  color: Colors.grey,
                  child: Center(
                    child: ElevatedButton(
                      child: Text("Sign out"),
                      onPressed: _signOut,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e);
    }
  }
}

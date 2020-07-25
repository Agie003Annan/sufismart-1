import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserView extends StatefulWidget {

  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test View"),
      ),
      body: Container(

      ),
    );
  }
}
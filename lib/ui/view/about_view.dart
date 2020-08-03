import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutView extends StatefulWidget {
  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  String notlep = "08676767676";
  static void openPhone(String phone){
    launch("tel:$phone");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: //Text("Suzuki Finance Indonesia"),
            Image.asset(
          'assets/images/logo_sfi_white.png',
          fit: BoxFit.cover,
          height: 30,
        ),
        backgroundColor: Hexcolor("#0d306b"),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Image.asset(
                'assets/images/logo_suzuki.png',
                height: 100.0,
                width: 100.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 20),
                child: Column(children: <Widget>[
                  Text(
                    "SUFI SMART",
                    style: TextStyle(
                      color: Hexcolor("#0d306b"),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "version : 1.4",
                    style: TextStyle(
                      color: Hexcolor("#0d306b"),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  )
                ]),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Call Center",
                            style: TextStyle(
                              color: Hexcolor("#0d306b"),
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          GestureDetector(
                            onTap: (){
                              openPhone(notlep);
                            },
                            child: Text(                              
                              notlep,
                              style: TextStyle(
                                color: Hexcolor("#0d306b"),
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    new Padding(
                        padding: EdgeInsets.all(8.0), child: new Divider()),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Email",
                            style: TextStyle(
                              color: Hexcolor("#0d306b"),
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "sfi_care@sfi.co.id",
                            style: TextStyle(
                              color: Hexcolor("#0d306b"),
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    new Padding(
                        padding: EdgeInsets.all(8.0), child: new Divider()),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

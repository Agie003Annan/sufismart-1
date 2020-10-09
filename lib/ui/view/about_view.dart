//import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_version/get_version.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:sufismart/ViewModel/AboutViewModel.dart';
import 'package:sufismart/enums/viewstate.dart';
import 'package:sufismart/ui/view/WebView.dart';
import 'package:sufismart/ui/view/base_view.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutView extends StatefulWidget {
  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  //String appName = '',packageName='',version='',buildNumber='' ;
  //String notlep = "08676767676";
  String _platformVersion = 'Unknown';
  String _projectVersion = '';
  String _projectCode = '';
  String _projectAppID = '';
  String _projectName = '';
  static void openPhone(String phone) {
    launch("tel:$phone");
  }

  // Future<void> checkapk() async {
  //   PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //   appName = packageInfo.version;
  //   return appName;
  // }
  // Future<String> getVersionNumber() async {
  //   PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //   String version = packageInfo.appName;

  //   return version;
  // }

  void _initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await GetVersion.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    String projectVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      projectVersion = await GetVersion.projectVersion;
    } on PlatformException {
      projectVersion = 'Failed to get project version.';
    }

    String projectCode;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      projectCode = await GetVersion.projectCode;
    } on PlatformException {
      projectCode = 'Failed to get build number.';
    }

    String projectAppID;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      projectAppID = await GetVersion.appID;
    } on PlatformException {
      projectAppID = 'Failed to get app ID.';
    }

    String projectName;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      projectName = await GetVersion.appName;
    } on PlatformException {
      projectName = 'Failed to get app name.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _projectVersion = projectVersion;
      _projectCode = projectCode;
      _projectAppID = projectAppID;
      _projectName = projectName;
    });
  }

  @override
  void initState() {
    _initPlatformState();
    super.initState();
    // PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
    //   appName = packageInfo.appName;
    //   packageName = packageInfo.packageName;
    //   version = packageInfo.version;
    //   buildNumber = packageInfo.buildNumber;
    // });
  }

//   PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
//   String appName = packageInfo.appName;
//   String packageName = packageInfo.packageName;
//   String version = packageInfo.version;
//   String buildNumber = packageInfo.buildNumber;
// });

  @override
  Widget build(BuildContext context) {
    return BaseView<AboutViewModel>(
      onModelReady: (model) => model.getInfoAplikasi(context),
      builder: (context, model, child) => Scaffold(
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
        body: ModalProgressHUD(
          inAsyncCall: model.state == ViewState.Busy ?? ViewState.Idle,
          child: model.dataAplikasi == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 15,
                        ),
                        Image.asset(
                          'assets/images/sufismart.png',
                          height: 100.0,
                          width: 100.0,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(top: 20),
                          child: Column(children: <Widget>[
                            Text(
                              "SUFI SMART" ,
                              style: TextStyle(
                                color: Hexcolor("#0d306b"),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "version : " + _projectVersion,
                              style: TextStyle(
                                color: Hexcolor("#0d306b"),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ]),
                        ),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                      onTap: () {
                                        openPhone(
                                            '${model.dataAplikasi.phone}');
                                      },
                                      child: Text(
                                        model.dataAplikasi.phone,
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
                                  padding: EdgeInsets.all(8.0),
                                  child: new Divider()),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                      model.dataAplikasi.email,
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
                                  padding: EdgeInsets.all(8.0),
                                  child: new Divider()),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => WebView2(
                                              linkurl:
                                                  "https://sufismart.sfi.co.id/sufismart/api/faq.php")));
                                },
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "FAQ",
                                        style: TextStyle(
                                          color: Hexcolor("#0d306b"),
                                          fontSize: 18,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Icon(FontAwesomeIcons.chevronRight,
                                          color: Hexcolor("#0d306b")),
                                    ],
                                  ),
                                ),
                              ),
                              new Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: new Divider()),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        ),
        // bottomNavigationBar: Container(
        //   height: 30,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: <Widget>[
        //       // FutureBuilder(
        //       //   future: getVersionNumber(),
        //       //   builder:
        //       //       (BuildContext context, AsyncSnapshot<String> snapshot) =>
        //       //           Text(
        //       //     snapshot.hasData ? snapshot.data : "Loading ...",
        //       //     style: TextStyle(color: Colors.black38),
        //       //   ),
        //       // ),
        //       Text(_projectCode +'-'+ _projectVersion +'-'+ _projectAppID +'-'+ _projectName),
        //       // ButtonTheme(
        //       //   minWidth: MediaQuery.of(context).size.width,
        //       //   child: RaisedButton(
        //       //     onPressed: () async {},
        //       //     child: Text(
        //       //       "Simpan",
        //       //       style: TextStyle(color: Colors.white),
        //       //     ),
        //       //   ),
        //       // )
        //     ],
        //   ),
        // ),
      ),
    );
  }
}

//import 'package:custom_navigator/custom_scaffold.dart';
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:skeleton_text/skeleton_text.dart';
//import 'package:sufismart/ViewModel/AccountViewModel.dart';
import 'package:sufismart/ui/view/account_view.dart';
import 'package:sufismart/ui/view/news_detail_view.dart';
import 'package:sufismart/ui/view/news_view.dart';
//import 'package:sufismart/ui/view/profil_view.dart';

import 'about_view.dart';
import 'contact_view.dart';
import 'home_view.dart';
//import 'login_view.dart';

class IndexView extends StatefulWidget {
  IndexView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _IndexViewState createState() => _IndexViewState();
}

class _IndexViewState extends State<IndexView> {
  final controller = PageController(viewportFraction: 0.8);
  int currentIndex = 0;
  static String titleNotif = '';
  static String kontenNotif = '';
  static String imgNotif = '';
  static String titlekey = '';
  static String kontenkey = '';
  static String tipekey = '';
  static String idkey = '';
  void _onNavBarTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void initState() {
    super.initState();
    OneSignal.shared
        .setNotificationReceivedHandler((OSNotification notification) {
      // will be called whenever a notification is received
      //getDataOnesignal(Map<String,dynamic> notification["data"]);

      titleNotif = notification.payload.title;
      kontenNotif = notification.payload.body;
      imgNotif = notification.payload.bigPicture;
      titlekey = notification.payload.additionalData["title_key"];
      kontenkey = notification.payload.additionalData["konten_key"];
      tipekey = notification.payload.additionalData["tipe"];
      idkey = notification.payload.additionalData["id_key"];

      setState(() {
        //idnotif = data["title_key"];
        // print(titleNotif);
        // print(kontenNotif);
        // print(imgNotif);
        // print(titlekey);
        // print(kontenkey);
        // print(tipekey);
        // print(idkey);
        if (titleNotif.isNotEmpty && kontenNotif.isNotEmpty) {
          return tipekey == "All"
              ? showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: SingleChildScrollView(
                        child: Container(
                          child: Column(
                            children: [
                              Text(
                                titlekey,
                                style: TextStyle(
                                    color: Color(0xff0d306b),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.right,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              CachedNetworkImage(
                                imageUrl: imgNotif,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  //height: MediaQuery.of(context).size.height / 3.5,
                                  height: 250,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    // borderRadius: BorderRadius.only(
                                    //     bottomLeft: Radius.circular(15),
                                    //     bottomRight: Radius.circular(15)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    image: DecorationImage(
                                        image: imageProvider, fit: BoxFit.fill),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    new SkeletonAnimation(
                                        child: Container(
                                  //height: MediaQuery.of(context).size.height / 3.5,
                                  height: 250,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15)),
                                  ),
                                )),
                                errorWidget: (context, url, error) =>
                                    new Container(
                                  //height: MediaQuery.of(context).size.height / 3.5,
                                  height: 250,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15))
                                    // borderRadius: BorderRadius.all(
                                    //     Radius.circular(10))
                                    ,
                                  ),
                                  child: Center(
                                    child: Icon(Icons.error),
                                  ),
                                ),
                              ),
                              // Image.network(
                              //   dataImg,
                              //   width: 200,
                              //   height: 200,
                              //   fit: BoxFit.contain,
                              // ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                kontenkey,
                                style: TextStyle(
                                    color: Color(0xff0d306b), fontSize: 16),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("Lihat Detail"),
                          onPressed: () {
                            //Put your code here which you want to execute on Yes button click.
                            //Navigator.of(context).pop();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      NewsDetail(detailNewsId: idkey
                                          // detailTitle:
                                          //     model.news[index].newstitle,
                                          // detailDate:
                                          //     model.news[index].newsdate,
                                          // detailDesc: model.news[index]
                                          //     .newsdescription,
                                          // detailImg: model
                                          //     .news[index].newsimage
                                          ),
                                ));
                          },
                        ),
                        FlatButton(
                          child: Text("Close"),
                          onPressed: () {
                            //Put your code here which you want to execute on Cancel button click.
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                )
              : showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Image.asset(
                        "assets/images/splashscreen.png",
                        width: 500,
                        height: 70,
                        fit: BoxFit.contain,
                      ),
                      content: SingleChildScrollView(
                        child: Container(
                          child: Column(
                            children: [
                              Text(
                                titlekey,
                                style: TextStyle(
                                    color: Color(0xff0d306b),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                kontenkey,
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("Ok"),
                          onPressed: () {
                            //Put your code here which you want to execute on Yes button click.
                            Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                          child: Text("Close"),
                          onPressed: () {
                            //Put your code here which you want to execute on Cancel button click.
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
        }
      });
    });

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      // will be called whenever a notification is opened/button pressed.
      // print(
      //     "Opened notification: \n${result.notification.jsonRepresentation().replaceAll("\\n", "\n")};");

      //var catID = result.notification.payload.additionalData['catID'];
      //print(result.notification.payload.additionalData["title_key"]);

      setState(() {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => NewsView(),
        //     ));
      });
    });
  }

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final _listPage = <Widget>[
    HomeView(),
    AboutView(),
    ContactView(),
    AccountView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _listPage[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: currentIndex == 0 ? Colors.white : Colors.white54,
              ),
              title: Text('Home',
                  style: TextStyle(
                    color: currentIndex == 0 ? Colors.white : Colors.white38,
                  ))),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.phone_android,
                color: currentIndex == 1 ? Colors.white : Colors.white54,
              ),
              title: Text('About',
                  style: TextStyle(
                    color: currentIndex == 1 ? Colors.white : Colors.white38,
                  ))),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.email,
                color: currentIndex == 2 ? Colors.white : Colors.white54,
              ),
              title: Text('Contact',
                  style: TextStyle(
                    color: currentIndex == 2 ? Colors.white : Colors.white38,
                  ))),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_pin,
                color: currentIndex == 3 ? Colors.white : Colors.white54,
              ),
              title: Text('Account',
                  style: TextStyle(
                    color: currentIndex == 3 ? Colors.white : Colors.white38,
                  ))),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Hexcolor("#0d306b"),
        currentIndex: currentIndex,
        onTap: _onNavBarTapped,
      ),
    );
    // return CustomScaffold(
    //   scaffold: Scaffold(
    //     bottomNavigationBar: BottomNavigationBar(
    //       items: [
    //         BottomNavigationBarItem(
    //             icon: Icon(
    //               Icons.home,
    //               color: currentIndex == 0 ? Colors.white : Colors.white54,
    //             ),
    //             title: Text('Home',
    //                 style: TextStyle(
    //                   color:
    //                       currentIndex == 0 ? Colors.white : Colors.white38,
    //                 ))),
    //         BottomNavigationBarItem(
    //             icon: Icon(
    //               Icons.phone_android,
    //               color: currentIndex == 1 ? Colors.white : Colors.white54,
    //             ),
    //             title: Text('About',
    //                 style: TextStyle(
    //                   color:
    //                       currentIndex == 1 ? Colors.white : Colors.white38,
    //                 ))),
    //         BottomNavigationBarItem(
    //             icon: Icon(
    //               Icons.email,
    //               color: currentIndex == 2 ? Colors.white : Colors.white54,
    //             ),
    //             title: Text('Contact',
    //                 style: TextStyle(
    //                   color:
    //                       currentIndex == 2 ? Colors.white : Colors.white38,
    //                 ))),
    //         BottomNavigationBarItem(
    //             icon: Icon(
    //               Icons.person_pin,
    //               color: currentIndex == 3 ? Colors.white : Colors.white54,
    //             ),
    //             title: Text('Account',
    //                 style: TextStyle(
    //                   color:
    //                       currentIndex == 3 ? Colors.white : Colors.white38,
    //                 ))),
    //       ],
    //       type:BottomNavigationBarType.fixed,
    //       backgroundColor: Hexcolor("#0d306b"),
    //       currentIndex: currentIndex,
    //     ),
    //   ),
    //   children: <Widget>[HomeView(), AboutView(), ContactView(), LoginView()],
    //   onItemTap: (index) {
    //     setState(() {
    //       currentIndex = index;
    //     });
    //   },
    // );
  }
}

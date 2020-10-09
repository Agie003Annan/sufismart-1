//import 'package:custom_navigator/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
//import 'package:sufismart/ViewModel/AccountViewModel.dart';
import 'package:sufismart/ui/view/account_view.dart';
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
    int currentIndex = 0;

    void _onNavBarTapped(int index){
    setState(() {
      currentIndex = index;
    });
  }

    GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    final _listPage = <Widget>[
    HomeView(), AboutView(), ContactView(), AccountView()
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
                        color:
                            currentIndex == 0 ? Colors.white : Colors.white38,
                      ))),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.phone_android,
                    color: currentIndex == 1 ? Colors.white : Colors.white54,
                  ),
                  title: Text('About',
                      style: TextStyle(
                        color:
                            currentIndex == 1 ? Colors.white : Colors.white38,
                      ))),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.email,
                    color: currentIndex == 2 ? Colors.white : Colors.white54,
                  ),
                  title: Text('Contact',
                      style: TextStyle(
                        color:
                            currentIndex == 2 ? Colors.white : Colors.white38,
                      ))),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_pin,
                    color: currentIndex == 3 ? Colors.white : Colors.white54,
                  ),
                  title: Text('Account',
                      style: TextStyle(
                        color:
                            currentIndex == 3 ? Colors.white : Colors.white38,
                      ))),
            ],
            type:BottomNavigationBarType.fixed,
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

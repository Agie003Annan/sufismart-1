// import 'package:custom_navigator/custom_navigation.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:sufismart/locator.dart';
import 'package:sufismart/ui/view/about_view.dart';
import 'package:sufismart/ui/view/contact_view.dart';
import 'package:sufismart/ui/view/home_view.dart';
import 'package:sufismart/ui/view/login_view.dart';
// import 'package:sufismart/ui/view/user_view.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sufismart',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Sufi Smart'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int currentIndex = 0;
  // GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // @override
  // Widget build(BuildContext context) {
  //   return CustomScaffold(
  //     scaffold: Scaffold(
  //       bottomNavigationBar: BottomNavigationBar(
  //         items: [
  //           BottomNavigationBarItem(
  //               icon: Icon(
  //                 Icons.home,
  //                 color: currentIndex == 0? Colors.white:Colors.white54,
  //               ),
  //               title: Text(
  //                   'Home',
  //                   style: TextStyle(
  //                     color: currentIndex == 0? Colors.white:Colors.white38,
  //                   )
  //               )
  //           ),
  //           BottomNavigationBarItem(
  //               icon: Icon(
  //                 Icons.phone_iphone,
  //                 color: currentIndex == 1? Colors.white:Colors.white54,
  //               ),
  //               title: Text(
  //                   'About',
  //                   style: TextStyle(
  //                     color: currentIndex == 1? Colors.white:Colors.white38,
  //                   )
  //               )
  //           ),
  //           BottomNavigationBarItem(
  //               icon: Icon(
  //                 Icons.email,
  //                 color: currentIndex == 2? Colors.white:Colors.white54,
  //               ),
  //               title: Text(
  //                   'Contact',
  //                   style: TextStyle(
  //                     color: currentIndex == 2? Colors.white:Colors.white38,
  //                   )
  //               )
  //           ),
  //           BottomNavigationBarItem(
  //               icon: Icon(
  //                 Icons.person_pin,
  //                 color: currentIndex == 3? Colors.white:Colors.white54,
  //               ),
  //               title: Text(
  //                   'Account',
  //                   style: TextStyle(
  //                     color: currentIndex == 3? Colors.white:Colors.white38,
  //                   )
  //               )
  //           ),
  //         ],
  //         type: BottomNavigationBarType.fixed,
  //         backgroundColor: Colors.blue[900],
  //         currentIndex: currentIndex,
  //       ),
  //     ),
  //     children: <Widget>[
  //       HomeView(),
  //       AboutView(),
  //       ContactView(),
  //       LoginView()
  //     ],
  //     onItemTap: (index) {
  //       setState(() {
  //         currentIndex = index;
  //       });
  //     },
  //   );
  // }
  int _selectedTabIndex = 0;

  // void _onNavBarTapped(int index){
  //   setState(() {
  //     _selectedTabIndex = index;
  //   });
  // }
  // String isLogin = "";
  // Future<String> checkSessionLogin() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   isLogin = prefs.getString('is_login') ?? "";
  //   return isLogin;
  // }

  final _listPage = <Widget>[
    HomeView(),
    AboutView(),
    ContactView(),
    LoginView()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _listPage[_selectedTabIndex],
      ),
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(iconData: Icons.home, title: "Home"),
          TabData(iconData: Icons.phone_iphone, title: "About"),
          TabData(iconData: Icons.email, title: "Contact"),
          TabData(iconData: Icons.person_pin, title: "Account"),
        ],
        circleColor: Hexcolor("#0d306b"),
        textColor: Hexcolor("#0d306b"),
        inactiveIconColor: Hexcolor("#0d306b"),
        onTabChangedListener: (position) {
          setState(() {
            _selectedTabIndex = position;
          });
        },
      ),
      /*bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: _selectedTabIndex == 0 ? Image.asset("assets/images/ic_home_active.png", width: 24, height: 24,) : Image.asset("assets/images/ic_home.png", width: 24, height: 24,),
            title: Text(
                'Home',
                style: TextStyle(
                    color: _selectedTabIndex == 0 ? colorSelected : colorNotSelected,
                    fontSize: 10
                )
            ),
          ),
          BottomNavigationBarItem(
              icon: _selectedTabIndex == 1 ? Image.asset("assets/images/ic_product_active.png", width: 24, height: 24,) : Image.asset("assets/images/ic_product.png", width: 24, height: 24,),
              title: Text(
                  'Produk',
                  style: TextStyle(
                      color: _selectedTabIndex == 1 ? colorSelected : colorNotSelected,
                      fontSize: 10
                  )
              )
          ),
          BottomNavigationBarItem(
              icon: _selectedTabIndex == 2 ? Image.asset("assets/images/ic_promo_active.png", width: 24, height: 24,) : Image.asset("assets/images/ic_promo.png", width: 24, height: 24,),
              title: Text(
                  'Promo',
                  style: TextStyle(
                      color: _selectedTabIndex == 2 ? colorSelected : colorNotSelected,
                      fontSize: 10
                  )
              )
          ),
          BottomNavigationBarItem(
              icon: _selectedTabIndex == 3 ? Image.asset("assets/images/ic_account_active.png", width: 24, height: 24,) : Image.asset("assets/images/ic_account.png", width: 24, height: 24,),
              title: Text(
                  'Akun',
                  style: TextStyle(
                      color: _selectedTabIndex == 3 ? colorSelected : colorNotSelected,
                      fontSize: 10
                  )
              )
          ),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: _selectedTabIndex,
        onTap: _onNavBarTapped,
      ),*/
    );
  }
}

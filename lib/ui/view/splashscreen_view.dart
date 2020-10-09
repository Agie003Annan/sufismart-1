import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sufismart/ui/view/indexpage_view.dart';
import 'package:sufismart/ui/view/slide_view.dart';

class SplashScreenView extends StatefulWidget{
  @override
  
  _SplashScreenState createState() => _SplashScreenState(); 

}

class _SplashScreenState extends State<SplashScreenView> with SingleTickerProviderStateMixin{
  //var _visible = true;

  // AnimationController animationController;
  // Animation<double> animation;

  @override
  void initState(){
    super.initState();
    /*try {
      versionCheck(context);
    } catch (e) {
      print(e);
    }*/
    startLaunching();
  }
  startLaunching() async {
    var duration = const Duration(seconds: 1);
    return new Timer(duration, () {
      Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (_) {
        return new IndexView();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Image.asset(
          "assets/images/splashscreen.png",
          height: 150.0,
          width: 250.0,
        ),
      ),
    );
  }
  // startSplashScreen() async{
  //   animationController = new AnimationController(
  //       vsync: this, duration: new Duration(seconds: 2));
  //   animation =
  //   new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

  //   animation.addListener(() => this.setState(() {}));
  //   animationController.forward();

  //   setState(() {
  //     _visible = !_visible;
  //   });
  //   var duration = const Duration(seconds: 3);
  //   return Timer(duration, () async {
  //     Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(
  //           builder: (context) => IndexView(title:"sufi smart"),
  //         )
  //     );
  //   });
  // }
  // @override
  // Widget build(BuildContext context) {    
  //   return Scaffold(
  //     backgroundColor: Colors.white,
  //     body: /*Container(
  //       width: MediaQuery.of(context).size.width,
  //       height:MediaQuery.of(context).size.height,
  //       padding: EdgeInsets.all(30),
  //       child: Center(
  //         child: Image.asset("assets/images/logo.png", width: 200, height: 200,),
  //       ),
  //     ),*/Stack(
  //       fit: StackFit.expand,
  //       children: <Widget>[
  //         new Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //             Container(
  //               width: MediaQuery.of(context).size.width,
  //               height:MediaQuery.of(context).size.height,
  //               padding: EdgeInsets.all(30),
  //               child: Center(
  //                 child: Image.asset("assets/images/splashscreen.png", width: animation.value * 300, height: animation.value * 300,),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ]
  //     ),
  //   );
  // }
  

}
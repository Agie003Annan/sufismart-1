import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart' as web ;
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:somedialog/somedialog.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart' as web;

import '../../main.dart';
import 'login_view.dart';

class ProfilView extends StatefulWidget {
  final String user;
  // receive data from the FirstScreen as a parameter
  ProfilView({Key key, @required this.user}) : super(key: key);
  @override
  _ProfilViewState createState() => _ProfilViewState();
}

class _ProfilViewState extends State<ProfilView> {
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
        actions: <Widget>[          
          FlatButton(
            textColor: Colors.white,
            onPressed: () async {
              SomeDialog(
                  context: context,
                  path: "assets/images/img_failed.png",
                  mode: SomeMode.Asset,
                  content: "apakah anda yakin ingin keluar \ndari akun ini ?",
                  title: "Logout",
                  appName: "",
                  imageHeight: 100,
                  imageWidth: 100,
                  dialogHeight: 260,
                  buttonConfig: ButtonConfig(
                    dialogDone: "yakin",
                    dialogCancel: "batal",
                    buttonDoneColor: Colors.orange,
                  ),
                  submit: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString("username", "");
                    prefs.setString('is_login', "");
                    print(prefs.getString('username'));
                    print(prefs.getString('is_login'));

                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginView()),
                        (Route<dynamic> route) => false);
                  });
            },
            child: Icon(FontAwesomeIcons.signOutAlt),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
        backgroundColor: Hexcolor("#0d306b"),
        automaticallyImplyLeading: false,
      ),
      body: WebView(
        initialUrl:
            "https://sufismart.sfi.co.id/sufismart/api/profil.php?EMAIL=${widget.user}",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {},
        javascriptChannels: <JavascriptChannel>[
          // JavascriptChannel(
          //     name: 'Toast_funct',
          //     onMessageReceived: (JavascriptMessage message) {
          //       // if(message.message == "Testing Inject"){

          //       // }
          //       print('message.message: ${message.message}');
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => WebView2(linkurl:message.message),
          //           )
          //       );
          //     }),
        ].toSet(),
        onPageStarted: (String url) {
          print("start url $url");
        },
        onPageFinished: (String url) {
          print("Finish url $url");
        },
      ),
      // child: WebviewScaffold(
      //   url:
      //       'https://sufismart.sfi.co.id/sufismart/api/profil.php?EMAIL=${widget.user}',
      //   withJavascript: true,
      //   withLocalStorage: true,
      //   withZoom: false,
      //   // javascriptChannels: <JavascriptChannel>[
      //   //   _alertJavascriptChannel(context),
      //   // ].toSet()

      //   // javascriptMode: JavascriptMode.unrestricted,
      //   // onWebViewCreated: (WebViewController webViewController) {
      //   //   _controller.complete(webViewController);
      //   // },
      // ),
      //resizeToAvoidBottomInset: true,
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

import 'indexpage_view.dart';
//import 'package:sufismart/ui/view/WebView.dart';
//import 'package:webview_flutter/webview_flutter.dart';
//import 'package:webview_flutter/webview_flutter.dart' as web;

class TestWebView extends StatefulWidget {
  @override
  _TestWebViewState createState() => _TestWebViewState();
}

class _TestWebViewState extends State<TestWebView> {
  //WebViewController _controller ;
  static Future<void> openbrowser(String url) async {
    //final url = 'http://maps.google.com/maps?q=loc:${lat},${lon}(${tag})';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // void main() async {
  //   final flutterWebviewPlugin = FlutterWebviewPlugin();
  //   flutterWebviewPlugin.onStateChanged.listen((state) async {
  //     if (state.type == WebViewState.finishLoad) {
  //       String script =
  //           'window.addEventListener("message", receiveMessage, false);' +
  //               'function receiveMessage(event) { window.postMessage(event.data);}';
  //       flutterWebviewPlugin.evalJavascript(script);
  //     }
  //   });
  // }

  // void initState() {
  //   //main();
  //   super.initState();
  // }

  // final Completer<WebViewController> _controller =
  //     Completer<WebViewController>();
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
        automaticallyImplyLeading: true,
         actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => IndexView()),
                ModalRoute.withName('/'),
              );
            },
            icon: new Icon(
              FontAwesomeIcons.home,
              size: 20,
              color: Colors.white,
            ),
          )
        ],
      ),
      // body: SafeArea(
      //   child: WebView(
      //     initialUrl: "https://sufismart.sfi.co.id/sufismart/api/layanan_2.php",
      //     javascriptMode: JavascriptMode.unrestricted,
      //     onWebViewCreated: (WebViewController webViewController) {
      //       _controller.complete(webViewController);
      //     },
      //     javascriptChannels: <JavascriptChannel>[
      //       JavascriptChannel(
      //           name: 'Toast_funct',
      //           onMessageReceived: (JavascriptMessage message) {
      //             // if(message.message == "Testing Inject"){

      //             // }
      //             openbrowser(message.message);
      //             print('message.message: ${message.message}');
      //             // Navigator.push(
      //             //     context,
      //             //     MaterialPageRoute(
      //             //       builder: (context) => WebView2(linkurl:message.message),
      //             //     )
      //             // );
      //           }),
      //     ].toSet(),

      //   ),
      // ),
      body: Container(
        child: WebviewScaffold(
            url: "https://sufismart.sfi.co.id/sufismart/api/layanan_2.php",
            withJavascript: true,
            withLocalStorage: true,
            withZoom: false,
            initialChild: Container(
              color: Colors.white,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            javascriptChannels: <JavascriptChannel>[
              JavascriptChannel(
                  name: 'Print',
                  onMessageReceived: (JavascriptMessage message) {
                    openbrowser(message.message);
                    print(message.message);
                  }),
            ].toSet()

            // javascriptMode: JavascriptMode.unrestricted,
            // onWebViewCreated: (WebViewController webViewController) {
            //   _controller.complete(webViewController);
            // },
            ),
      ),
    );
    //return WebView(linkurl: null);
  }
}

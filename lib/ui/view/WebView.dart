import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:hexcolor/hexcolor.dart';

class WebView2 extends StatelessWidget {
  final String linkurl;
  // receive data from the FirstScreen as a parameter
  WebView2({Key key, @required this.linkurl}) : super(key: key);

  // JavascriptChannel _alertJavascriptChannel(BuildContext context) {
  //   return JavascriptChannel(
  //       name: 'Toast_funct',
  //       onMessageReceived: (JavascriptMessage message) {
  //         print(message.message);
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: //Text("Suzuki Finance Indonesia"),
            Image.asset(
          'assets/logo_sfi_white.png',
          fit: BoxFit.cover,
          height: 30,
        ),
        backgroundColor: Hexcolor("#0d306b"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: WebviewScaffold(
            url: linkurl,
            withJavascript: true,
            withLocalStorage: true,
            withZoom: false,
            // javascriptChannels: <JavascriptChannel>[
            //   _alertJavascriptChannel(context),
            // ].toSet()

            // javascriptMode: JavascriptMode.unrestricted,
            // onWebViewCreated: (WebViewController webViewController) {
            //   _controller.complete(webViewController);
            // },
            ),
      ),
    );
  }
}

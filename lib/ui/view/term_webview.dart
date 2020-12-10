import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:hexcolor/hexcolor.dart';

class WebViewTerm extends StatefulWidget {
  final String linkurl;
  WebViewTerm({Key key, @required this.linkurl}) : super(key: key);
  _WebViewTermState createState() => _WebViewTermState();
}

class _WebViewTermState extends State<WebViewTerm> {
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
      ),
      body: Container(
        child: WebviewScaffold(
          url: widget.linkurl,
          withJavascript: true,
          withLocalStorage: true,
          withZoom: false,
          initialChild: Container(
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
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

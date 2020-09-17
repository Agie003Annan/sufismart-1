import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:hexcolor/hexcolor.dart';


class WebView2 extends StatefulWidget{
  final String linkurl;  
  WebView2({Key key, @required this.linkurl}) : super(key: key);
  _WebView2State createState() => _WebView2State();
}

class _WebView2State extends State<WebView2>{
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

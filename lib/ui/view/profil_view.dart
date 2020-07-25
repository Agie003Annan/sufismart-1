import 'package:flutter/material.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart' as web ;
import 'package:hexcolor/hexcolor.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart' as web;

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
        backgroundColor: Hexcolor("#0d306b"),
        automaticallyImplyLeading: false,
      ),
      body: web.WebView(
          initialUrl: "https://sufismart.sfi.co.id/sufismart/api/profil.php?EMAIL=${widget.user}",
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

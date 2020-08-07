import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:sufismart/ui/view/WebView.dart';
import 'package:webview_flutter/webview_flutter.dart';
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
      body: SafeArea(
        child: WebView(
          initialUrl: "https://sufismart.sfi.co.id/sufismart/api/layanan_2.php",
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {},
          javascriptChannels: <JavascriptChannel>[
            JavascriptChannel(
                name: 'Toast_funct',
                onMessageReceived: (JavascriptMessage message) {
                  // if(message.message == "Testing Inject"){
                    
                  // }
                  openbrowser(message.message);
                  print('message.message: ${message.message}');
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => WebView2(linkurl:message.message),
                  //     )
                  // );
                }),
          ].toSet(),
          // onPageStarted: (String url) {
          //   print("start url $url");
          // },
          // onPageFinished: (String url) {
          //   print("Finish url $url");
          // },
        ),
      ),
    );
    //return WebView(linkurl: null);
  }
}

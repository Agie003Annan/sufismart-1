import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sufismart/ViewModel/AccountViewModel.dart';
import 'package:sufismart/ui/view/base_view.dart';
import 'package:sufismart/ui/view/indexpage_view.dart';
import 'package:sufismart/ui/view/login_view.dart';

class StatusKontrakView extends StatefulWidget {
  _StatusKontrakViewState createState() => _StatusKontrakViewState();
}

class _StatusKontrakViewState extends State<StatusKontrakView> {
  String islogin = "";

  Future<String> checkSessionLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    islogin = prefs.getString('username') ?? "";
    return islogin;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: checkSessionLogin(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return BaseView<AccountViewModel>(
              onModelReady: (model) => model.getInfoCustomer(context, islogin),
              builder: (context, model, child) => Scaffold(
                backgroundColor: Colors.white,
                body: islogin == ""
                    ? noLoginView(context)
                    : viewStatusKontrak(context, islogin)
                    // ModalProgressHUD(
                    //     inAsyncCall:
                    //         model.state == ViewState.Busy ?? ViewState.Idle,
                    //     child: model.dataprofile != null &&
                    //             model.dataprofile.nokontrak1 != ""
                    //         ? viewStatusKontrak(context, islogin)
                    //         : noKontrak(context),
                    //   ),
              ),
            );
          } else {
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
        });
  }

  Widget noKontrak(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: //Text(""),
                Image.asset(
              'assets/images/logo_sfi_white.png',
              fit: BoxFit.cover,
              height: 30,
            ),
            backgroundColor: Hexcolor("#0d306b"),
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: new Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/images/not_login.png", width: 300),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "halaman ini khusus untuk customer suzuki finance",
                  style: TextStyle(
                      color: Hexcolor("#0d306b"),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                // Text(
                //   "Silahkan login terlebih dahulu",
                //   style: TextStyle(color: Colors.grey),
                // ),
                SizedBox(
                  height: 20,
                ),
                // ButtonTheme(
                //   buttonColor: Hexcolor("#0d306b"),
                //   minWidth: MediaQuery.of(context).size.width - 100,
                //   child: RaisedButton(
                //     disabledColor: Color(0xffcccccc),
                //     onPressed: () async {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => LoginView(),
                //           ));
                //     },
                //     child: Text(
                //       "Login",
                //       style: TextStyle(color: Colors.white),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget noLoginView(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/images/not_login.png", width: 300),
              SizedBox(
                height: 20,
              ),
              Text(
                "Anda belum login",
                style: TextStyle(
                    color: Hexcolor("#0d306b"),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Silahkan login terlebih dahulu",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 20,
              ),
              ButtonTheme(
                buttonColor: Hexcolor("#0d306b"),
                minWidth: MediaQuery.of(context).size.width - 100,
                child: RaisedButton(
                  disabledColor: Color(0xffcccccc),
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginView(),
                        ));
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget viewStatusKontrak(BuildContext context, String user) {
    return Scaffold(
      appBar: AppBar(
        title: //Text("Suzuki Finance Indonesia"),
            Image.asset(
          'assets/images/logo_sfi_white.png',
          fit: BoxFit.cover,
          height: 30,
        ),
        backgroundColor: Hexcolor("#0d306b"),        
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
      body: WebviewScaffold(
        url:
            "https://sufismart.sfi.co.id/sufismart/api/ic_product.php?EMAIL=${user}",
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
    );
  }
}

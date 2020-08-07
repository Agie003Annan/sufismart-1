import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:somedialog/somedialog.dart';
import 'package:sufismart/ViewModel/LoginViewModel.dart';
import 'package:sufismart/enums/viewstate.dart';
import 'package:sufismart/ui/view/base_view.dart';
import 'package:sufismart/ui/view/forgotpassword_view.dart';
import 'package:sufismart/ui/view/profil_view.dart';
//import 'package:sufismart/ui/view/profil_view.dart';
import 'package:sufismart/ui/view/registration_view.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart' as web;

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String _error = "";
  String islogin = "";
  String username = "";

  // final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _emailController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _email;
  String _password;

  //  SharedPreferences prefs = await SharedPreferences.getInstance();
  //  username = prefs.getString("username");

  // Future<String> sessionUsername() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   username = prefs.getString('username') ?? "";
  //   return username;
  // }

  //  nameRetriever() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(){
  //   nameText = prefs.getString('name') ?? '';
  //   schoolText = prefs.getString('school') ?? '';
  //   }
  //  }

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
            return BaseView<LoginViewModel>(
              builder: (context, model, child) => Scaffold(
                backgroundColor: Colors.white,
                // appBar: AppBar(
                //   title: //Text("Suzuki Finance Indonesia"),
                //       Image.asset(
                //     'assets/images/logo_sfi_white.png',
                //     fit: BoxFit.cover,
                //     height: 30,
                //   ),
                //   // actions: <Widget>[
                //   //   Visibility(
                //   //     visible: islogin == "" ? false : true,
                //   //     child: FlatButton(
                //   //       textColor: Colors.white,
                //   //       onPressed: () async {
                //   //         SomeDialog(
                //   //             context: context,
                //   //             path: "assets/images/img_failed.png",
                //   //             mode: SomeMode.Asset,
                //   //             content:
                //   //                 "apakah anda yakin ingin keluar \ndari akun ini ?",
                //   //             title: "Logout",
                //   //             appName: "",
                //   //             imageHeight: 100,
                //   //             imageWidth: 100,
                //   //             dialogHeight: 260,
                //   //             buttonConfig: ButtonConfig(
                //   //               dialogDone: "yakin",
                //   //               dialogCancel: "batal",
                //   //               buttonDoneColor: Colors.orange,
                //   //             ),
                //   //             submit: () async {
                //   //               SharedPreferences prefs =
                //   //                   await SharedPreferences.getInstance();
                //   //               prefs.setString("username", "");
                //   //               prefs.setString('is_login', "");
                //   //               print(prefs.getString('username'));
                //   //               print(prefs.getString('is_login'));

                //   //               Navigator.pushAndRemoveUntil(
                //   //                   context,
                //   //                   MaterialPageRoute(
                //   //                       builder: (context) => LoginView()),
                //   //                   (Route<dynamic> route) => false);
                //   //             });
                //   //       },
                //   //       child: Icon(FontAwesomeIcons.signOutAlt),
                //   //       shape: CircleBorder(
                //   //           side: BorderSide(color: Colors.transparent)),
                //   //     ),
                //   //   ),
                //   // ],
                //   backgroundColor: Hexcolor("#0d306b"),
                //   automaticallyImplyLeading: false,
                // ),
                body: islogin != ""
                    ? profilView(context,islogin)
                    : ModalProgressHUD(
                        inAsyncCall:
                            model.state == ViewState.Busy ?? ViewState.Idle,
                        child: SingleChildScrollView(
                          child: Container(
                            child: Form(
                              key: _formKey,
                              autovalidate: _autoValidate,
                              child: Container(
                                padding: EdgeInsets.all(30),
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  children: <Widget>[
                                    // Container(
                                    //   padding: EdgeInsets.only(top:50, left: 30, right: 30, bottom: 30),
                                    //   //height: 100,
                                    //   decoration: BoxDecoration(
                                    //       gradient: const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter,colors: [
                                    //         Color(0xff0d306b),
                                    //         Colors.indigo,
                                    //       ]),
                                    //       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50))
                                    //   ),
                                    //   child: Column(
                                    //     mainAxisAlignment: MainAxisAlignment.start,
                                    //     crossAxisAlignment: CrossAxisAlignment.start,
                                    //     children: <Widget>[
                                    //       Row(
                                    //         children: <Widget>[
                                    //           Expanded(
                                    //             flex: 3,
                                    //             child: Text(
                                    //               "Welcome,",
                                    //               style: TextStyle(
                                    //                 color: Colors.white,
                                    //                 fontSize: 20,
                                    //                 fontWeight: FontWeight.w600
                                    //               ),
                                    //             ),
                                    //           ),
                                    //           Expanded(
                                    //             flex: 1,
                                    //             child: Row(
                                    //               mainAxisAlignment: MainAxisAlignment.end,
                                    //               children: <Widget>[
                                    //                 Icon(
                                    //                   FontAwesomeIcons.userCircle,
                                    //                   color: Colors.white,
                                    //                 ),
                                    //                 SizedBox(width: 10,),
                                    //                 Icon(
                                    //                   FontAwesomeIcons.bell,
                                    //                   color: Colors.white,
                                    //                 )
                                    //               ],
                                    //             ),
                                    //           )
                                    //         ],
                                    //       ),
                                    //       Text(
                                    //         "Dear",
                                    //         style: TextStyle(
                                    //             color: Colors.white,
                                    //             fontSize: 28,
                                    //             fontWeight: FontWeight.w900
                                    //         ),
                                    //         overflow: TextOverflow.ellipsis,
                                    //         maxLines: 1,
                                    //       ),
                                    //       SizedBox(height: 5,),
                                    //       Text(
                                    //         "Choose Suzuki Finance Indonesia \nfor your Suzuki credit",
                                    //         //"Pilih Suzuki Finance Indonesia \nUntuk kenyamanan kredit Suzuki anda",
                                    //         style: TextStyle(
                                    //             color: Colors.white,
                                    //           fontSize: 12
                                    //         ),
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(
                                        "Selamat Datang Kembali,",
                                        style: TextStyle(
                                            color: Hexcolor("#0d306b"),
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(
                                        "Masukan email dan password anda yang terdaftar di aplikasi SUFI SMART",
                                        style: TextStyle(
                                          color: Hexcolor("#0d306b"),
                                          fontSize: 16,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 20),
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        children: <Widget>[
                                          TextFormField(
                                            autofocus: false,
                                            inputFormatters: [
                                              WhitelistingTextInputFormatter(
                                                  new RegExp('[a-zA-Z0-9_.@]'))
                                            ],
                                            decoration: const InputDecoration(
                                              labelText: 'Email',
                                              labelStyle: TextStyle(
                                                color: Colors.grey,
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            // controller: _emailController,
                                            validator: (String value) {
                                              Pattern pattern =
                                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                              RegExp regex =
                                                  new RegExp(pattern);
                                              if (value.isEmpty) {
                                                return 'Email tidak boleh kosong';
                                              } else if (!regex
                                                  .hasMatch(value)) {
                                                return 'Masukan email yang valid';
                                              }
                                              return null;
                                            },
                                            onSaved: (String value) {
                                              _email = value;
                                            },
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            cursorColor: Colors.grey,
                                          ),
                                          // Container(
                                          //   height: 50,
                                          //   child: TextField(
                                          //     obscureText: model.hidePass,
                                          //     keyboardType: TextInputType.text,
                                          //     inputFormatters: [
                                          //       WhitelistingTextInputFormatter(new RegExp(
                                          //           '[a-zA-Z0-9.!@#\$%^&*(),;:{}|<>]'))
                                          //     ],
                                          //     autofocus: false,
                                          //     decoration: InputDecoration(
                                          //       hintText: 'Masukan kata sandi anda',
                                          //       fillColor: Colors.white,
                                          //       enabledBorder: UnderlineInputBorder(
                                          //           borderSide:
                                          //               BorderSide(color: Color(0xffcccccc))),
                                          //       suffixIcon: IconButton(
                                          //         icon: Icon(
                                          //           model.hidePass
                                          //               ? FontAwesomeIcons.eyeSlash
                                          //               : FontAwesomeIcons.eye,
                                          //           color: Colors.black,
                                          //           size: 14,
                                          //         ),
                                          //         onPressed: () => model.changeHidePass(),
                                          //       ),
                                          //     ),
                                          //     style: TextStyle(
                                          //       fontSize: 15,
                                          //     ),
                                          //   ),
                                          // ),

                                          TextFormField(
                                            obscureText: model.hidePass,
                                            //controller: _passwordController,
                                            keyboardType: TextInputType.text,
                                            // cursorColor: Colors.grey,
                                            inputFormatters: [
                                              WhitelistingTextInputFormatter(
                                                  new RegExp(
                                                      '[a-zA-Z0-9.!@#\$%^&*(),;:{}|<>]'))
                                            ],
                                            autofocus: false,
                                            validator: (String value) {
                                              if (value.isEmpty) {
                                                return 'Password tidak boleh kosong';
                                              }
                                              return null;
                                            },
                                            onSaved: (String value) {
                                              _password = value;
                                            },
                                            decoration: InputDecoration(
                                              labelText: 'Password',
                                              labelStyle: TextStyle(
                                                color: Colors.grey,
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey),
                                              ),
                                              suffixIcon: IconButton(
                                                icon: Icon(
                                                  model.hidePass
                                                      ? FontAwesomeIcons
                                                          .eyeSlash
                                                      : FontAwesomeIcons.eye,
                                                  color: Colors.black,
                                                  size: 14,
                                                ),
                                                onPressed: () =>
                                                    model.changeHidePass(),
                                              ),
                                            ),
                                          ),

                                          SizedBox(
                                            height: 10,
                                          ),
                                          Visibility(
                                            visible:
                                                _error == "" ? false : true,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  _error,
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              if (_formKey.currentState
                                                  .validate()) {
                                                // No any error in validation
                                                _formKey.currentState.save();
                                                var loginSuccess =
                                                    await model.checkLogin(
                                                        _email,
                                                        _password,
                                                        context);
                                                if (loginSuccess) {
                                                  // final SharedPreferences
                                                  //     prefs =
                                                  //     await SharedPreferences
                                                  //         .getInstance();
                                                  // Navigator.pushReplacement(
                                                  //     context,
                                                  //     MaterialPageRoute(
                                                  //       builder: (context) =>
                                                  //           ProfilView(
                                                  //       ),
                                                  //     ));
                                                  profilView(context, _email);
                                                  // Scaffold.of(context)
                                                  //     .showSnackBar(SnackBar(
                                                  //   content: Text(_error =
                                                  //       prefs.getString('username')),
                                                  // ));
                                                  // print("berhasil login");
                                                  setState(() {
                                                    _error = "";
                                                  });
                                                } else {
                                                  final SharedPreferences
                                                      prefs =
                                                      await SharedPreferences
                                                          .getInstance();
                                                  setState(() {
                                                    _error = prefs
                                                        .getString('message');
                                                  });
                                                }
                                              } else {
                                                setState(() {
                                                  _error = "";
                                                  _autoValidate = true;
                                                });
                                              }
                                            },
                                            child: Container(
                                              height: 50,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  color: Hexcolor("#0d306b"),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                              child: Center(
                                                child: Text(
                                                  "LOGIN",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          RegistrasiView()));
                                              // print(_emailController.text);
                                              // print(_passwordController.text);
                                            },
                                            child: Container(
                                              height: 50,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                              child: Center(
                                                  child: Text(
                                                "SIGNUP",
                                                style: TextStyle(
                                                  color: Hexcolor("#FFFFFF"),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                ),
                                              )),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ForgotPasswordView()));
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(top: 20),
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Text(
                                                "Lupa Password ?",
                                                style: TextStyle(
                                                  color: Hexcolor("#0d306b"),
                                                  fontSize: 14,
                                                ),
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                // bottomNavigationBar: Container(
                //   height: 30,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: <Widget>[
                //       Text(
                //         "Belum Punya Akun ? silahkan daftar "
                //       ),
                //       Text(
                //         "disini"
                //       )
                //       // ButtonTheme(
                //       //   minWidth: MediaQuery.of(context).size.width,
                //       //   child: RaisedButton(
                //       //     onPressed: () async {},
                //       //     child: Text(
                //       //       "Simpan",
                //       //       style: TextStyle(color: Colors.white),
                //       //     ),
                //       //   ),
                //       // )
                //     ],
                //   ),
                // ),
              ),
            );
          } else {
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
        });
  }
}

Widget profilView(BuildContext context, String url) {
  return Scaffold(
    appBar: AppBar(
      title: //Text("Suzuki Finance Indonesia"),
          Image.asset(
        'assets/images/logo_sfi_white.png',
        fit: BoxFit.cover,
        height: 30,
      ),
      actions: <Widget>[
        Visibility(
          visible: url == "" ? false : true,
          child: FlatButton(
            textColor: Colors.white,
            onPressed: () async {
              SomeDialog(
                  context: context,
                  path: "assets/images/logout_img.png",
                  mode: SomeMode.Asset,
                  content: "apakah anda yakin ingin keluar \ndari akun ini ?",
                  title: "Logout",
                  appName: "",
                  imageHeight: 150,
                  imageWidth: 150,
                  dialogHeight: 300,
                  buttonConfig: ButtonConfig(
                    dialogDone: "yakin",
                    dialogCancel: "batal",
                    buttonDoneColor: Hexcolor("0d306b"),
                  ),
                  submit: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString("username", "");
                    prefs.setString('is_login', "");
                    // print(prefs.getString('username'));
                    // print(prefs.getString('is_login'));
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginView(),
                      ),
                    );
                  });
            },
            child: Icon(FontAwesomeIcons.signOutAlt),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ),
      ],
      backgroundColor: Hexcolor("#0d306b"),
      automaticallyImplyLeading: false,
    ),
    body: WebView(
      initialUrl:
          "https://sufismart.sfi.co.id/sufismart/api/profil.php?EMAIL=${url}",
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
      // onPageStarted: (String url) {
      //   print("start url $url");
      // },
      // onPageFinished: (String url) {
      //   print("Finish url $url");
      // },
    ),
  );
}

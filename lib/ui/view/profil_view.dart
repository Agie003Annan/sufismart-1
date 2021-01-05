import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart' as web ;
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:somedialog/somedialog.dart';
import 'package:sufismart/ViewModel/AccountViewModel.dart';
import 'package:sufismart/enums/viewstate.dart';
import 'package:sufismart/ui/componen/dialog.dart';
import 'package:sufismart/ui/view/base_view.dart';
import 'package:sufismart/ui/view/indexpage_view.dart';
//import 'package:sufismart/ui/view/success_view.dart';
import 'package:sufismart/ui/widget/dialog_success.dart';
// import 'package:sufismart/ui/view/nologin_view.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'login_view.dart';

class ProfilView extends StatefulWidget {
  String email,
      nama,
      telp,
      tanggal,
      pekerjaan,
      gender,
      noktp,
      kontrak1,
      kontrak2,
      kontrak3;
  // receive data from the FirstScreen as a parameter
  ProfilView(
      {Key key,
      @required this.email,
      this.nama,
      this.telp,
      this.tanggal,
      this.pekerjaan,
      this.gender,
      this.noktp,
      this.kontrak1,
      this.kontrak2,
      this.kontrak3})
      : super(key: key);
  @override
  _ProfilViewState createState() => _ProfilViewState();
}

class _ProfilViewState extends State<ProfilView> {
  DateTime selectedDateFrom = DateTime.now();
  String islogin;
  Future<String> checkSessionLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    islogin = prefs.getString('username') ?? "";
    return islogin;
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _tanggalcontroller = TextEditingController();
  final TextEditingController _pekerjaancontroller = TextEditingController();
  final TextEditingController _gendercontroller = TextEditingController();
  final TextEditingController _ktpcontroller = TextEditingController();
  final TextEditingController _nokontrak1controller = TextEditingController();
  final TextEditingController _nokontrak2controller = TextEditingController();
  final TextEditingController _nokontrak3controller = TextEditingController();
  final TextEditingController _tglEditContoller = TextEditingController();

  String _error = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _email = "";
  String _tgl = "";
  String _nama,
      _telp,
      _tanggal,
      _pekerjaan,
      _gender,
      _noktp,
      _kontrak1,
      _kontrak2,
      _kontrak3;

  initState() {
    super.initState();
    setState(() {
    _emailController.text = widget.email;
    _namaController.text = widget.nama;
    _phoneController.text = widget.telp;
    _tanggalcontroller.text = widget.tanggal;
    _pekerjaancontroller.text = widget.pekerjaan;
    _gendercontroller.text = widget.gender;
    _ktpcontroller.text = widget.noktp;
    _nokontrak1controller.text = widget.kontrak1;
    _nokontrak2controller.text = widget.kontrak2;
    _nokontrak3controller.text = widget.kontrak3;
    });
  }

  dispose() {
    super.dispose();
  }

  // final Completer<WebViewController> _controller =
  //     Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    final format = DateFormat("yyyy/MM/dd");
    
    return BaseView<AccountViewModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text("Profil"),
          //     Image.asset(
          //   'assets/images/logo_sfi_white.png',
          //   fit: BoxFit.cover,
          //   height: 30,
          // ),
          centerTitle: true,
          backgroundColor: Hexcolor("#0d306b"),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: new Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
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
        body: ModalProgressHUD(
            inAsyncCall: model.state == ViewState.Busy ?? ViewState.Idle,
            child: SingleChildScrollView(
              child: Container(
                child: Form(
                  key: _formKey,
                  autovalidate: _autoValidate,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          // child: Text(
                          //   "Kontak Kami",
                          //   style: TextStyle(
                          //       color: Hexcolor("#0d306b"),
                          //       fontSize: 18,
                          //       fontWeight: FontWeight.bold),
                          //   textAlign: TextAlign.left,
                          // ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            "Terimakasih sudah bergabung dan menjadi bagian dari Suzuki Finance dan aplikasi SUFI Smart",
                            style: TextStyle(
                              color: Hexcolor("#0d306b"),
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                controller: _emailController,
                                autofocus: false,
                                enabled: false,
                                inputFormatters: [
                                  WhitelistingTextInputFormatter(
                                      new RegExp('[a-zA-Z0-9_.@]'))
                                ],
                                decoration: const InputDecoration(
                                    labelText: 'Email',
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey))),
                                keyboardType: TextInputType.emailAddress,
                                cursorColor: Colors.grey,
                                validator: (String value) {
                                  Pattern pattern =
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                  RegExp regex = new RegExp(pattern);
                                  if (value.isEmpty) {
                                    return 'Email tidak boleh kosong';
                                  } else if (!regex.hasMatch(value)) {
                                    return 'Masukan email yang valid';
                                  }
                                  return null;
                                },
                                onSaved: (String value) {
                                  _email = value;
                                },
                              ),
                              TextFormField(
                                controller: _namaController,
                                autofocus: false,                                
                                inputFormatters: [
                                  WhitelistingTextInputFormatter(
                                      new RegExp('[a-zA-Z ]'))
                                ],
                                decoration: const InputDecoration(
                                    labelText: 'Nama Lengkap',
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey))),
                                keyboardType: TextInputType.text,
                                cursorColor: Colors.grey,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Nama tidak boleh kosong';
                                  }
                                  return null;
                                },
                                onSaved: (String value) {
                                  _nama = value;
                                },
                              ),
                              TextFormField(
                                controller: _tanggalcontroller,
                                keyboardType: TextInputType.datetime,
                                autofocus: false,
                                readOnly: true,
                                decoration: const InputDecoration(
                                  labelText: 'Tanggal Lahir',
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                ),
                                cursorColor: Colors.grey,
                                onTap: () async {
                                  final DateTime picked = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2101));
                                  if (picked != null &&
                                      picked != selectedDateFrom) {
                                    setState(() {
                                      selectedDateFrom = picked;
                                      _tanggalcontroller.text =
                                          '${format.format(selectedDateFrom)}';
                                      //print(_tanggalcontroller.text);
                                    });
                                  }
                                },
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Tanggal lahir tidak boleh kosong';
                                  }
                                  return null;
                                },
                                onSaved: (String value) {
                                  _tanggal = value;
                                },
                              ),

                              TextFormField(
                                controller: _phoneController,
                                autofocus: false,
                                decoration: const InputDecoration(
                                    labelText: 'Nomor Telepon',
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey))),
                                keyboardType: TextInputType.number,
                                cursorColor: Colors.grey,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Nomor telepon tidak boleh kosong';
                                  } else if (value.length < 11) {
                                    return 'Nomor telepon minimal 11 digit';
                                  } else if (value.length > 15) {
                                    return 'Nomor telepon maximal 15 digit';
                                  }
                                  return null;
                                },
                                onSaved: (String value) {
                                  _telp = value;
                                },
                              ),
                              TextFormField(
                                controller: _gendercontroller,
                                enabled: false,
                                autofocus: false,
                                inputFormatters: [
                                  WhitelistingTextInputFormatter(
                                      new RegExp('[a-zA-Z ]'))
                                ],
                                decoration: const InputDecoration(
                                    labelText: 'Gender',
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey))),
                                keyboardType: TextInputType.text,
                                cursorColor: Colors.grey,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Gender tidak boleh kosong';
                                  }
                                  return null;
                                },
                                onSaved: (String value) {
                                  _gender = value;
                                },
                              ),
                              TextFormField(
                                controller: _pekerjaancontroller,
                                enabled: false,
                                autofocus: false,
                                inputFormatters: [
                                  WhitelistingTextInputFormatter(
                                      new RegExp('[a-zA-Z ]'))
                                ],
                                decoration: const InputDecoration(
                                    labelText: 'Pekerjaan',
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey))),
                                keyboardType: TextInputType.text,
                                cursorColor: Colors.grey,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Pekerjaan tidak boleh kosong';
                                  }
                                  return null;
                                },
                                onSaved: (String value) {
                                  _pekerjaan = value;
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Info ini khusus untuk customer suzuki finance",
                                  style: TextStyle(
                                    color: Hexcolor("#0d306b"),
                                    fontSize: 14,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              TextFormField(
                                controller: _ktpcontroller,
                                autofocus: false,
                                decoration: const InputDecoration(
                                    labelText: 'No KTP',
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey))),
                                keyboardType: TextInputType.number,
                                cursorColor: Colors.grey,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Nomor Ktp tidak boleh kosong';
                                  } else if (value.length < 10) {
                                    return 'Nomor Ktp minimal 8 digit';
                                  } else if (value.length > 16) {
                                    return 'Nomor Ktp maximal 16 digit';
                                  }
                                  return null;
                                },
                                onSaved: (String value) {
                                  _noktp = value;
                                },
                              ),
                              TextFormField(
                                controller: _nokontrak1controller,
                                autofocus: false,
                                decoration: const InputDecoration(
                                    labelText: 'No Kontrak 1',
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey))),
                                keyboardType: TextInputType.number,
                                cursorColor: Colors.grey,
                                // validator: (String value) {
                                //   if (value.length < 10) {
                                //     return 'Nomor Kontrak minimal 8 digit';
                                //   } else if (value.length > 16) {
                                //     return 'Nomor Kontrak maximal 16 digit';
                                //   }
                                //   return null;
                                // },
                                onSaved: (String value) {
                                  _kontrak1 = value;
                                },
                              ),
                              TextFormField(
                                controller: _nokontrak2controller,
                                autofocus: false,
                                decoration: const InputDecoration(
                                    labelText: 'No Kontrak 2',
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey))),
                                keyboardType: TextInputType.number,
                                cursorColor: Colors.grey,
                                // validator: (String value) {
                                //   if (value.length < 10) {
                                //     return 'Nomor Kontrak minimal 8 digit';
                                //   } else if (value.length > 16) {
                                //     return 'Nomor Kontrak maximal 16 digit';
                                //   }
                                //   return null;
                                // },
                                onSaved: (String value) {
                                  _kontrak2 = value;
                                },
                              ),
                              TextFormField(
                                controller: _nokontrak3controller,
                                autofocus: false,
                                decoration: const InputDecoration(
                                    labelText: 'No Kontrak 3',
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey))),
                                keyboardType: TextInputType.number,
                                cursorColor: Colors.grey,
                                // validator: (String value) {
                                //   if (value.length < 10) {
                                //     return 'Nomor Kontrak minimal 8 digit';
                                //   } else if (value.length > 16) {
                                //     return 'Nomor Kontrak maximal 16 digit';
                                //   }
                                //   return null;
                                // },
                                onSaved: (String value) {
                                  _kontrak3 = value;
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              // Visibility(
                              //   visible: _error == "" ? false : true,
                              //   child: Row(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: <Widget>[
                              //       Text(
                              //         _error,
                              //         style: TextStyle(color: Colors.red),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              Visibility(
                                visible: _error == "" ? false : true,
                                child: Container(
                                    padding: EdgeInsets.all(20),
                                    margin: EdgeInsets.only(bottom: 20),
                                    decoration: BoxDecoration(
                                        color: Colors.red[200],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            // Icon(
                                            //   FontAwesomeIcons.exclamationTriangle,
                                            //   color: Colors.white,
                                            //   size: 12,
                                            // ),
                                            // SizedBox(
                                            //   width: 10,
                                            // ),
                                            Text(
                                              "Error :",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(_error,
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ],
                                    )),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  var connectivityResult = await (Connectivity()
                                      .checkConnectivity());
                                  if (connectivityResult ==
                                      ConnectivityResult.none) {
                                    DialogForm.dialogForm(
                                        context,
                                        'No Internet',
                                        "You're not connected to a network");
                                  } else {
                                    if (_formKey.currentState.validate()) {
                                      // No any error in validation
                                      _formKey.currentState.save();
                                      // print(_nama);
                                      // print(_email);
                                      // print(_telp);
                                      // print(_pekerjaan);
                                      // print(_gender);
                                      // print(_kontrak1);
                                      // print(_kontrak2);
                                      // print(_kontrak3);
                                      // print(_noktp);
                                      // print(_tanggal);

                                      var updateprofil = await model.sendProfil(
                                          _email,
                                          _tanggal,
                                          _telp,
                                          _kontrak1,
                                          _kontrak2,
                                          _kontrak3,
                                          _noktp,
                                          context);
                                      if (updateprofil == true) {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //       builder: (context) => SuccessView(
                                        //         msg: "Successfully update Data",
                                        //       ),
                                        //     ));
                                        SuccessDialog(
                                          context: context,
                                          title: "Sukses",
                                          content: "Profile berhasil diupdate",
                                          imageHeight: 100,
                                          imageWidth: 100,
                                          dialogHeight: 260,
                                          path: null,
                                        );
                                        new Future.delayed(
                                            new Duration(seconds: 2), () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        });
                                        setState(() {
                                          _error = "";
                                          _autoValidate = false;
                                          // _namalengkapController
                                          //     .clear();
                                          // _phoneController
                                          //     .clear();
                                          // _emailController
                                          //     .clear();
                                          // _pesanController
                                          //     .clear();
                                        });
                                      } else {
                                        final SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();
                                        setState(() {
                                          _error =
                                              prefs.getString('message_update');
                                        });
                                      }
                                    } else {
                                      // validation error
                                      setState(() {
                                        _error = "";
                                        _autoValidate = true;
                                      });
                                    }
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Hexcolor("#0d306b"),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  child: Center(
                                    child: Text(
                                      "Save",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
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
            )

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
            ),
      ),
    );
  }
}

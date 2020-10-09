import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sufismart/ViewModel/AccountViewModel.dart';
import 'package:sufismart/enums/viewstate.dart';
import 'package:sufismart/ui/view/base_view.dart';
import 'package:sufismart/ui/view/indexpage_view.dart';
import 'package:sufismart/ui/widget/dialog_success.dart';

class ChangePasswordView extends StatefulWidget {
  final String email;
  ChangePasswordView({Key key, @required this.email});

  _ChangePasswordVIewState createState() => _ChangePasswordVIewState();
}

class _ChangePasswordVIewState extends State<ChangePasswordView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _passwordLama, _passwordBaru, _passwordConfirm;
  String _error = "";  

  initState() {
    super.initState();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<AccountViewModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Ubah Kata Sandi",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Hexcolor("#0d306b"),
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
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
          // actions: <Widget>[
          //   IconButton(
          //       icon: new Icon(FontAwesomeIcons.home, size: 20, color: Colors.green,),
          //       onPressed: () {
          //         Navigator.of(context).pushNamedAndRemoveUntil('index', ModalRoute.withName('change_password'));
          //       }
          //   ),
          // ],
        ),
        body: ModalProgressHUD(
          inAsyncCall: model.state == ViewState.Busy ?? ViewState.Idle,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                autovalidate: _autoValidate,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            obscureText: model.hidePass,
                            autofocus: false,
                            decoration: InputDecoration(
                              labelText: 'Kata sandi Lama',
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  model.hidePass
                                      ? FontAwesomeIcons.eyeSlash
                                      : FontAwesomeIcons.eye,
                                  color: Colors.black,
                                  size: 14,
                                ),
                                onPressed: () => model.changeHidePass(),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.grey,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Password Lama tidak boleh kosong';
                              }
                              return null;
                            },
                            onSaved: (String value) {
                              _passwordLama = value;
                            },
                          ),
                          TextFormField(
                            obscureText: model.hidePass,
                            autofocus: false,
                            decoration: InputDecoration(
                              labelText: 'Kata Sandi Baru',
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  model.hidePass
                                      ? FontAwesomeIcons.eyeSlash
                                      : FontAwesomeIcons.eye,
                                  color: Colors.black,
                                  size: 14,
                                ),
                                onPressed: () => model.changeHidePass(),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.grey,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Password baru tidak boleh kosong';
                              } else if (value.length < 6) {
                                return 'Password baru terlalu pendek';
                              }
                              return null;
                            },
                            onSaved: (String value) {
                              _passwordBaru = value;
                            },
                          ),
                          TextFormField(
                            obscureText: model.hidePass,
                            autofocus: false,
                            decoration: InputDecoration(
                              labelText: 'Konfirmasi kata sandi baru',
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  model.hidePass
                                      ? FontAwesomeIcons.eyeSlash
                                      : FontAwesomeIcons.eye,
                                  color: Colors.black,
                                  size: 14,
                                ),
                                onPressed: () => model.changeHidePass(),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.grey,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Password konfirmasi tidak boleh kosong';
                              } else if (value.length < 6) {
                                return 'Password konfirmasi terlalu pendek';
                              }
                              return null;
                            },
                            onSaved: (String value) {
                              _passwordConfirm = value;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Visibility(
                      visible: _error == "" ? false : true,
                      child: Container(
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                              color: Colors.red[200],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(_error,
                                  style: TextStyle(color: Colors.white)),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
          height: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ButtonTheme(
                buttonColor: Hexcolor("#0d306b"),
                minWidth: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  padding: EdgeInsets.all(4),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      // No any error in validation
                      _formKey.currentState.save();
                      if (_passwordBaru != _passwordConfirm) {
                        setState(() {
                          _error =
                              "Konfirmasi Kata sandi tidak sesuai sama dengan password baru";
                        });
                      } else {
                        var changePassword = await model.sendUpdatePassword(
                            widget.email,
                            _passwordLama,
                            _passwordBaru,
                            context);
                        if (changePassword == true) {
                          SuccessDialog(
                            context: context,
                            title: "Sukses",
                            content: "Password berhasil diupdate",
                            imageHeight: 100,
                            imageWidth: 100,
                            dialogHeight: 260,
                            path: null,
                          );
                          new Future.delayed(new Duration(seconds: 2), () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          });
                          setState(() {
                            _error = "";
                            _autoValidate = false;
                          });
                        } else {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          setState(() {
                            _error = prefs.getString('message_password');
                          });
                        }
                      }
                      print(widget.email);
                      print(_passwordLama);
                      print(_passwordBaru);
                      print(_passwordConfirm);
                    } else {
                      // validation error
                      setState(() {
                        _error = "";
                        _autoValidate = true;
                      });
                    }
                  },
                  child: Text(
                    "Update",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}

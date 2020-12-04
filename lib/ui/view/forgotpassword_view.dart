import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sufismart/ViewModel/ContactViewModel.dart';
import 'package:sufismart/enums/viewstate.dart';
import 'package:sufismart/ui/componen/dialog.dart';
import 'package:sufismart/ui/view/success_view.dart';

import 'base_view.dart';

class ForgotPasswordView extends StatefulWidget {
  _ForgotPasswordViewState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final TextEditingController _emailController = TextEditingController();
  String _error = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _email;
  @override
  Widget build(BuildContext context) {
    return BaseView<ContactViewModel>(
        builder: (context, model, child) => Scaffold(
              backgroundColor: Colors.white,
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
              body: ModalProgressHUD(
                inAsyncCall: model.state == ViewState.Busy ?? ViewState.Idle,
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
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "Forgot Password",
                                style: TextStyle(
                                    color: Hexcolor("#0d306b"),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "Silahkan masukan email valid yang sudah terdaftar dalam aplikasi SUFI SMART",
                                style: TextStyle(
                                  color: Hexcolor("#0d306b"),
                                  fontSize: 14,
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
                                    controller: _emailController,
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
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey))),
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
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Visibility(
                                    visible: _error == "" ? false : true,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          _error,
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      var connectivityResult =
                                          await (Connectivity()
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
                                          print(_email);
                                          var keluhan =
                                              await model.sendForgotPassword(
                                                  _email, context);
                                          if (keluhan == true) {
                                            final SharedPreferences prefs =
                                                await SharedPreferences
                                                    .getInstance();
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      SuccessView(
                                                          msg: prefs.getString(
                                                              'message_password')),
                                                ));
                                            setState(() {
                                              _error = "";
                                              _autoValidate = false;
                                              _emailController.clear();
                                            });
                                          } else {
                                            final SharedPreferences prefs =
                                                await SharedPreferences
                                                    .getInstance();
                                            setState(() {
                                              _error = prefs.getString(
                                                  'message_password');
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      child: Center(
                                        child: Text(
                                          "Kirim",
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
                ),
              ),
            ));
  }
}

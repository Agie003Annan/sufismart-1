import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sufismart/ViewModel/ContactViewModel.dart';
import 'package:sufismart/enums/viewstate.dart';
import 'package:sufismart/ui/view/base_view.dart';
import 'package:sufismart/ui/view/success_view.dart';

class ContactView extends StatefulWidget {
  @override
  _ContactViewState createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  final TextEditingController _namalengkapController = TextEditingController();
  final TextEditingController _nohpController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _pesanController = TextEditingController();
  String _error = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _name = "";
  String _email = "";
  String _phone = "";
  String _pesan = "";
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
                automaticallyImplyLeading: false,
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
                                "Kontak Kami",
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
                                "Silahkan mengisi informasi dibawah ini untuk keluhan dan layanan lainnya",
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
                                    controller: _namalengkapController,
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
                                            borderSide: BorderSide(
                                                color: Colors.grey))),
                                    keyboardType: TextInputType.text,
                                    cursorColor: Colors.grey,
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return 'Nama tidak boleh kosong';
                                      }
                                      return null;
                                    },
                                    onSaved: (String value) {
                                      _name = value;
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
                                            borderSide: BorderSide(
                                                color: Colors.grey))),
                                    keyboardType: TextInputType.number,
                                    cursorColor: Colors.grey,
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return 'Nomor telepon tidak boleh kosong';
                                      } else if (value.length < 10) {
                                        return 'Nomor telepon minimal 8 digit';
                                      } else if (value.length > 15) {
                                        return 'Nomor telepon maximal 15 digit';
                                      }
                                      return null;
                                    },
                                    onSaved: (String value) {
                                      _phone = value;
                                    },
                                  ),
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
                                  TextFormField(
                                    controller: _pesanController,
                                    decoration: const InputDecoration(
                                        labelText: 'Pesan',
                                        labelStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey))),
                                    keyboardType: TextInputType.text,
                                    cursorColor: Colors.grey,
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return 'Pesan tidak boleh kosong';
                                      }
                                      return null;
                                    },
                                    onSaved: (String value) {
                                      _pesan = value;
                                    },
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      if (_formKey.currentState.validate()) {
                                        // No any error in validation
                                        _formKey.currentState.save();
                                        print(_name);
                                        print(_email);
                                        print(_phone);
                                        print(_pesan);
                                        var keluhan = await model.sendKeluhan(
                                            _name,
                                            _email,
                                            _phone,
                                            _pesan,
                                            context);
                                        if (keluhan == true) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SuccessView(msg: "Successfully Send Data",),
                                              ));
                                          setState(() {
                                            _error = "";
                                            _autoValidate = false;
                                            _namalengkapController.clear();
                                            _phoneController.clear();
                                            _emailController.clear();
                                            _pesanController.clear();
                                          });
                                        } else {
                                          final SharedPreferences prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          setState(() {
                                            _error = prefs.getString('message');
                                          });
                                        }
                                      } else {
                                        // validation error
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
    // return Scaffold(
    //   appBar: AppBar(
    //     title: //Text("Suzuki Finance Indonesia"),
    //         Image.asset(
    //       'assets/images/logo_sfi_white.png',
    //       fit: BoxFit.cover,
    //       height: 30,
    //     ),
    //     backgroundColor: Hexcolor("#0d306b"),
    //     automaticallyImplyLeading: false,
    //   ),
    //   body:
    // );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sufismart/ViewModel/RegistrasiViewModel.dart';
import 'package:sufismart/enums/viewstate.dart';
import 'package:sufismart/ui/view/base_view.dart';

class RegistrasiView extends StatefulWidget {
  _RegistrasiViewState createState() => _RegistrasiViewState();
}

class _RegistrasiViewState extends State<RegistrasiView> {
  String _valDropDownJob;
  String _valDropDownGender;
  DateTime selectedDateFrom = DateTime.now();
  String _error = "";
  final TextEditingController _dateFromController = TextEditingController();
  final TextEditingController _namalengkapController = TextEditingController();
  final TextEditingController _nohpController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  List<String> job = [
    "MAHASISWA",
    "PNS",
    "WIRASWASTA",
    "PENSIUNAN",
    "WIRAUSAHA",
    "PENGUSAHA",
  ];

  List<String> gender = ["MALE", "FEMALE"];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _name;
  String _email;
  String _phone;
  String _password;
  String _tgllahir;

  @override
  Widget build(BuildContext context) {
    final format = DateFormat("yyyy-MM-dd");
    return BaseView<RegistrasiViewModel>(
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
                  child: Column(children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "Pendaftaran Akun",
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
                        child: Column(children: <Widget>[
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            autofocus: false,
                            inputFormatters: [
                              WhitelistingTextInputFormatter(
                                  new RegExp('[a-zA-Z ]'))
                            ],
                            //controller: _namalengkapController,
                            decoration: const InputDecoration(
                              labelText: 'Nama Lengkap',
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Nama tidak boleh kosong';
                              }
                              return null;
                            },
                            onSaved: (String value) {
                              _name = value;
                            },
                            cursorColor: Colors.grey,
                          ),
                          // DateTimeField(
                          //   format: format,
                          //   onShowPicker: (context, currentValue) {
                          //     return showDatePicker(
                          //         context: context,
                          //         firstDate: DateTime(1900),
                          //         initialDate: currentValue ?? DateTime.now(),
                          //         lastDate: DateTime(2100));
                          //   },
                          //   decoration: const InputDecoration(
                          //       labelText: 'Tanggal Lahir',
                          //       labelStyle: TextStyle(
                          //         color: Colors.grey,
                          //       ),
                          //       focusedBorder: UnderlineInputBorder(
                          //           borderSide: BorderSide(color: Colors.grey))),
                          //   keyboardType: TextInputType.text,
                          //   cursorColor: Colors.grey,
                          // ),
                          TextFormField(
                            controller: _dateFromController,
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
                                  firstDate: DateTime(1990),
                                  lastDate: DateTime(2101));
                              if (picked != null && picked != selectedDateFrom)
                                setState(() {
                                  selectedDateFrom = picked;
                                  _dateFromController.text =
                                      '${format.format(selectedDateFrom)}';
                                });
                            },
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Tanggal lahir tidak boleh kosong';
                              }
                              return null;
                            },
                            onSaved: (String value) {
                              _tgllahir = value;
                            },
                          ),
                          TextFormField(
                            //controller: _nohpController,
                            autofocus: false,
                            decoration: const InputDecoration(
                                labelText: 'Nomor Telepon',
                                labelStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                isDense: true,
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey))),
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
                            //controller: _emailController,
                            autofocus: false,
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
                            //controller: _passwordController,
                            obscureText: model.hidePass,
                            autofocus: false,
                            decoration: InputDecoration(
                              labelText: 'Password',
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
                                return 'Password tidak boleh kosong';
                              } else if (value.length < 6) {
                                return 'Password terlalu pendek';
                              }
                              return null;
                            },
                            onSaved: (String value) {
                              _password = value;
                            },
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Pilih Pekerjaan"),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFFEEEEEE),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  margin: EdgeInsets.only(top: 10),
                                  width: double.infinity,
                                  height: 30,
                                  child: DropdownButton<String>(
                                    hint: Text(
                                      "Choose job",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    value: _valDropDownJob,
                                    icon: Icon(Icons.arrow_drop_down),
                                    isExpanded: true,
                                    iconSize: 24,
                                    elevation: 16,
                                    style: TextStyle(color: Colors.blue[900]),
                                    underline: Container(
                                      height: 2,
                                      color: Colors.transparent,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        _valDropDownJob = value;
                                      });
                                    },
                                    items: job.map((value) {
                                      return DropdownMenuItem(
                                        child: Text(
                                          value,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        value: value,
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                            width: double.infinity,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Gender"),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFFEEEEEE),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  margin: EdgeInsets.only(top: 10),
                                  width: double.infinity,
                                  height: 30,
                                  child: DropdownButton<String>(
                                    hint: Text(
                                      "Choose Gender",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    value: _valDropDownGender,
                                    icon: Icon(Icons.arrow_drop_down),
                                    isExpanded: true,
                                    iconSize: 24,
                                    elevation: 16,
                                    style: TextStyle(color: Colors.blue[900]),
                                    underline: Container(
                                      height: 2,
                                      color: Colors.transparent,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        _valDropDownGender = value;
                                      });
                                    },
                                    items: gender.map((value) {
                                      return DropdownMenuItem(
                                        child: Text(
                                          value,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        value: value,
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                            width: double.infinity,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Visibility(
                            visible: _error == "" ? false : true,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                              if (_formKey.currentState.validate()) {
                                // No any error in validation
                                _formKey.currentState.save();
                                print(_name);
                                print(_phone);
                                print(_tgllahir);
                                print(_email);
                                print(_password);
                                print(_valDropDownGender);
                                print(_valDropDownJob);
                                var register = await model.sendRegistrasi(
                                    _name,
                                    _phone,
                                    _tgllahir,
                                    _email,
                                    _password,
                                    _valDropDownJob,
                                    _valDropDownGender,
                                    context);
                                if (register == true) {
                                  // Navigator.pushReplacement(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) => SuccessView(),
                                  //     )
                                  // );
                                  final SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  setState(() {
                                    _error = prefs.getString('message_regis');
                                    // _name = "";
                                    // _phone = "";
                                    // _email = "";
                                    // _password = "";
                                  });
                                } else {
                                  final SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  setState(() {
                                    _error = prefs.getString('message_regis');
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
                            // onTap: () async {
                            //   print(_namalengkapController.text);
                            //   print(_nohpController.text);
                            //   print(_dateFromController.text);
                            //   print(_emailController.text);
                            //   print(_passwordController.text);
                            //   print(_valDropDownGender);
                            //   print(_valDropDownJob);

                            // var regisSuccess = await model.sendRegistrasi(
                            //     _namalengkapController.text,
                            //     _nohpController.text,
                            //     _dateFromController.text,
                            //     _emailController.text,
                            //     _passwordController.text,
                            //     _valDropDownJob,
                            //     _valDropDownGender,
                            //     context);
                            //   if (regisSuccess) {
                            //     final SharedPreferences prefs =
                            //         await SharedPreferences.getInstance();
                            //     // Scaffold.of(context).showSnackBar(SnackBar(
                            //     //     content:
                            //     //         Text(_error = prefs.getString('message')),
                            //     //   ));
                            //     setState(() {
                            //       _error = prefs.getString('message_regis');
                            //     });
                            //   } else {
                            //     final SharedPreferences prefs =
                            //         await SharedPreferences.getInstance();
                            //     //  return Scaffold.of(context).showSnackBar(
                            //     //     SnackBar(
                            //     //       content: Text(_error =
                            //     //         prefs.getString('message'),
                            //     //       ),
                            //     //     ),
                            //     //   );
                            //     setState(() {
                            //       _error = prefs.getString('message_regis');
                            //     });
                            //   }
                            // },
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Hexcolor("#0d306b"),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Center(
                                  child: Text(
                                "Kirim",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              )),
                            ),
                          )
                        ])),
                  ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: //Text("Suzuki Finance Indonesia"),
    //         Image.asset(
    //       'assets/images/logo_sfi_white.png',
    //       fit: BoxFit.cover,
    //       height: 30,
    //     ),
    //     backgroundColor: Hexcolor("#0d306b"),
    //   ),
    //   body: SingleChildScrollView(
    //     child: Container(

    //     ),
    //   ),
    // );
  }
}

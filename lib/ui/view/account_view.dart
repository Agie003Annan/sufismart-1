import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:somedialog/somedialog.dart';
import 'package:sufismart/ViewModel/AccountViewModel.dart';
import 'package:sufismart/enums/viewstate.dart';
import 'package:sufismart/ui/view/base_view.dart';
import 'package:sufismart/ui/view/changepassword_view.dart';
import 'package:sufismart/ui/view/login_view.dart';
import 'package:sufismart/ui/view/profil_view.dart';

import 'indexpage_view.dart';

class AccountView extends StatefulWidget {
  @override
  _AccountViewState createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  String islogin;
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
                onModelReady: (model) =>
                    model.getInfoCustomer(context, islogin),
                builder: (context, model, child) => Scaffold(
                      appBar: AppBar(
                        title: //Text("Suzuki Finance Indonesia"),
                            Image.asset(
                          'assets/images/logo_sfi_white.png',
                          fit: BoxFit.cover,
                          height: 30,
                        ),
                        actions: <Widget>[
                          IconButton(
                            icon: new Icon(
                              FontAwesomeIcons.home,
                              size: 20,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        IndexView()),
                                ModalRoute.withName('/'),
                              );
                            },
                          )
                        ],
                        // actions: <Widget>[
                        //   Visibility(
                        //     visible: islogin == "" ? false : true,
                        //     child: FlatButton(
                        //       textColor: Colors.white,
                        //       onPressed: () async {
                        //         SomeDialog(
                        //             context: context,
                        //             path: "assets/images/logout_img.png",
                        //             mode: SomeMode.Asset,
                        //             content:
                        //                 "apakah anda yakin ingin keluar \ndari akun ini ?",
                        //             title: "Logout",
                        //             appName: "",
                        //             imageHeight: 150,
                        //             imageWidth: 150,
                        //             dialogHeight: 300,
                        //             buttonConfig: ButtonConfig(
                        //               dialogDone: "yakin",
                        //               dialogCancel: "batal",
                        //               buttonDoneColor: Hexcolor("0d306b"),
                        //             ),
                        //             submit: () async {
                        //               SharedPreferences prefs =
                        //                   await SharedPreferences.getInstance();
                        //               prefs.setString("username", "");
                        //               prefs.setString('is_login', "");
                        //               // print(prefs.getString('username'));
                        //               // print(prefs.getString('is_login'));
                        //               Navigator.of(context).pushReplacement(
                        //                 MaterialPageRoute(
                        //                   builder: (context) => LoginView(),
                        //                 ),
                        //               );
                        //             });
                        //       },
                        //       child: Icon(FontAwesomeIcons.signOutAlt),
                        //       shape: CircleBorder(
                        //           side: BorderSide(color: Colors.transparent)),
                        //     ),
                        //   ),
                        // ],
                        backgroundColor: Hexcolor("#0d306b"),
                        automaticallyImplyLeading: false,
                      ),
                      body: islogin == ""
                          ? LoginView()
                          : ModalProgressHUD(
                              inAsyncCall: model.state == ViewState.Busy ??
                                  ViewState.Idle,
                              child: model.dataprofile == null
                                  ? Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : SingleChildScrollView(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            top: 20,
                                            bottom: 10,
                                            right: 20,
                                            left: 20),
                                        child: Column(children: <Widget>[
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 20),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Column(
                                                      children: <Widget>[
                                                        GestureDetector(
                                                          onTap: () {},
                                                          child: ClipOval(
                                                            child:
                                                                CachedNetworkImage(
                                                              imageUrl:
                                                                  "https://sufismart.sfi.co.id/sufismart/assets/img/user2.jpg",
                                                              imageBuilder:
                                                                  (context,
                                                                          imageProvider) =>
                                                                      Container(
                                                                height: 90,
                                                                width: 90,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              50)),
                                                                  image: DecorationImage(
                                                                      image:
                                                                          imageProvider,
                                                                      fit: BoxFit
                                                                          .cover),
                                                                ),
                                                              ),
                                                              placeholder: (context,
                                                                      url) =>
                                                                  new SkeletonAnimation(
                                                                      child:
                                                                          Container(
                                                                width: 90,
                                                                height: 90,
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                            .grey[
                                                                        300],
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(50))),
                                                              )),
                                                              errorWidget: (context,
                                                                      url,
                                                                      error) =>
                                                                  new Container(
                                                                width: 90,
                                                                height: 90,
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                            .grey[
                                                                        300],
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(50))),
                                                                child: Center(
                                                                  child: Icon(
                                                                      Icons
                                                                          .error),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: <Widget>[
                                                              Container(
                                                                child: Text(
                                                                    "Selamat Datang, " +
                                                                        model
                                                                            .dataprofile
                                                                            .nama,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      AccountView(),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  border: Border.all(
                                                    color: Colors.grey[100],
                                                  )),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          Divider(),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => ProfilView(
                                                          email: model
                                                              .dataprofile
                                                              .email,
                                                          nama: model
                                                              .dataprofile.nama,
                                                          telp: model
                                                              .dataprofile
                                                              .nohandphone,
                                                          tanggal: model
                                                              .dataprofile
                                                              .tanggallahir,
                                                          pekerjaan: model
                                                              .dataprofile
                                                              .pekerjaan,
                                                          gender: model
                                                              .dataprofile
                                                              .gender,
                                                          noktp: model
                                                              .dataprofile
                                                              .noktp,
                                                          kontrak1: model
                                                              .dataprofile
                                                              .nokontrak1,
                                                          kontrak2: model
                                                              .dataprofile
                                                              .nokontrak2,
                                                          kontrak3: model
                                                              .dataprofile
                                                              .nokontrak3),
                                                    )).then((value) {
                                                  model.getInfoCustomer(
                                                      context, islogin);
                                                });
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(5),
                                                child: Column(
                                                  children: <Widget>[
                                                    Row(
                                                      children: <Widget>[
                                                        Expanded(
                                                          flex: 1,
                                                          child: Container(
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: <
                                                                  Widget>[
                                                                Container(
                                                                    child: //Icon(iconData, size: 14, color: Colors.grey),
                                                                        Image
                                                                            .asset(
                                                                  "assets/images/ic_icon_address.png",
                                                                  width: 15,
                                                                  height: 15,
                                                                )),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Expanded(
                                                            flex: 6,
                                                            child: Container(
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: <
                                                                    Widget>[
                                                                  Container(
                                                                    child: Text(
                                                                        "Edit Profil",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            color: Colors.grey)),
                                                                  ),
                                                                ],
                                                              ),
                                                            )),
                                                        Expanded(
                                                          flex: 1,
                                                          child: Container(
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: <
                                                                  Widget>[
                                                                Container(
                                                                  child: Icon(
                                                                      Icons
                                                                          .arrow_forward_ios,
                                                                      size: 16,
                                                                      color: Colors
                                                                          .grey),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          // buildBar(
                                          //     context,
                                          //     ,
                                          //     'Edit Profil',

                                          Divider(),
                                          buildBar(
                                              context,
                                              "assets/images/ic_icon_password.png",
                                              'Atur Ulang Kata Sandi',
                                              ChangePasswordView(
                                                email: model.dataprofile.email,
                                              )),
                                          Divider(),
                                          // Container(
                                          //   width: MediaQuery.of(context).size.width,
                                          //   child: InkWell(
                                          //     onTap: () async {
                                          //       //await FlutterLaunch.launchWathsApp(phone: "5534992019999", message: "Hello");
                                          //       // FlutterOpenWhatsapp.sendSingleMessage(
                                          //       //     "6281218000312",
                                          //       //     "Halo, saya butuh bantuan :)");
                                          //     },
                                          //     child: Container(
                                          //       padding: EdgeInsets.all(5),
                                          //       child: Column(
                                          //         children: <Widget>[
                                          //           Row(
                                          //             children: <Widget>[
                                          //               Expanded(
                                          //                 flex: 1,
                                          //                 child: Container(
                                          //                   child: Column(
                                          //                     crossAxisAlignment:
                                          //                         CrossAxisAlignment
                                          //                             .start,
                                          //                     children: <Widget>[
                                          //                       Container(
                                          //                         child: Icon(
                                          //                             FontAwesomeIcons
                                          //                                 .whatsapp,
                                          //                             size: 14,
                                          //                             color: Colors
                                          //                                 .grey),
                                          //                       ),
                                          //                     ],
                                          //                   ),
                                          //                 ),
                                          //               ),
                                          //               SizedBox(
                                          //                 width: 10,
                                          //               ),
                                          //               Expanded(
                                          //                   flex: 6,
                                          //                   child: Container(
                                          //                     child: Column(
                                          //                       crossAxisAlignment:
                                          //                           CrossAxisAlignment
                                          //                               .start,
                                          //                       children: <Widget>[
                                          //                         Container(
                                          //                           child: Text(
                                          //                               "Customer Service",
                                          //                               style: TextStyle(
                                          //                                   fontSize:
                                          //                                       12,
                                          //                                   fontWeight:
                                          //                                       FontWeight
                                          //                                           .bold,
                                          //                                   color: Colors
                                          //                                       .grey)),
                                          //                         ),
                                          //                       ],
                                          //                     ),
                                          //                   )),
                                          //               Expanded(
                                          //                 flex: 1,
                                          //                 child: Container(
                                          //                   child: Column(
                                          //                     crossAxisAlignment:
                                          //                         CrossAxisAlignment
                                          //                             .end,
                                          //                     children: <Widget>[
                                          //                       Container(
                                          //                         child: Icon(
                                          //                             Icons
                                          //                                 .arrow_forward_ios,
                                          //                             size: 16,
                                          //                             color: Colors
                                          //                                 .grey),
                                          //                       ),
                                          //                     ],
                                          //                   ),
                                          //                 ),
                                          //               )
                                          //             ],
                                          //           ),
                                          //         ],
                                          //       ),
                                          //     ),
                                          //   ),
                                          // ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: GestureDetector(
                                              onTap: () async {
                                                SomeDialog(
                                                    context: context,
                                                    path:
                                                        "assets/images/logout_img.png",
                                                    mode: SomeMode.Asset,
                                                    content:
                                                        "apakah anda yakin ingin keluar \ndari akun ini ?",
                                                    title: "Logout",
                                                    appName: "",
                                                    imageHeight: 150,
                                                    imageWidth: 150,
                                                    dialogHeight: 300,
                                                    buttonConfig: ButtonConfig(
                                                      dialogDone: "yakin",
                                                      dialogCancel: "batal",
                                                      buttonDoneColor:
                                                          Hexcolor("0d306b"),
                                                    ),
                                                    submit: () async {
                                                      SharedPreferences prefs =
                                                          await SharedPreferences
                                                              .getInstance();
                                                      prefs.setString(
                                                          "username", "");
                                                      prefs.setString(
                                                          'is_login', "");
                                                      // print(prefs.getString('username'));
                                                      // print(prefs.getString('is_login'));
                                                      // Navigator.of(context)
                                                      //     .pushReplacement(
                                                      //   MaterialPageRoute(
                                                      //     builder: (context) =>
                                                      //         LoginView(),
                                                      //   ),
                                                      // );
                                                      Navigator
                                                          .pushAndRemoveUntil(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (BuildContext
                                                                    context) =>
                                                                IndexView()),
                                                        ModalRoute.withName(
                                                            '/'),
                                                      );
                                                    });
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(5),
                                                child: Column(
                                                  children: <Widget>[
                                                    Row(
                                                      children: <Widget>[
                                                        Expanded(
                                                          flex: 1,
                                                          child: Container(
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: <
                                                                  Widget>[
                                                                Container(
                                                                    child: //Icon(iconData, size: 14, color: Colors.grey),
                                                                        Image
                                                                            .asset(
                                                                  "assets/images/ic_icon_signout.png",
                                                                  width: 15,
                                                                  height: 15,
                                                                )),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Expanded(
                                                            flex: 6,
                                                            child: Container(
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: <
                                                                    Widget>[
                                                                  Container(
                                                                    child: Text(
                                                                        "Keluar",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            color: Colors.grey)),
                                                                  ),
                                                                ],
                                                              ),
                                                            )),
                                                        Expanded(
                                                          flex: 1,
                                                          child: Container(
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: <
                                                                  Widget>[
                                                                Container(
                                                                  child: Icon(
                                                                      Icons
                                                                          .arrow_forward_ios,
                                                                      size: 16,
                                                                      color: Colors
                                                                          .grey),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Divider(),
                                        ]),
                                      ),
                                    ),
                            ),
                    ));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  static Widget buildBar(BuildContext context, String imageAsset, String title,
      Widget actionType) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => actionType,
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              child: //Icon(iconData, size: 14, color: Colors.grey),
                                  Image.asset(
                            imageAsset,
                            width: 15,
                            height: 15,
                          )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      flex: 6,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(title,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey)),
                            ),
                          ],
                        ),
                      )),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            child: Icon(Icons.arrow_forward_ios,
                                size: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

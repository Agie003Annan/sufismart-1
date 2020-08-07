import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:sufismart/ViewModel/branchViewModel.dart';
import 'package:sufismart/model/kota_model.dart';
import 'package:sufismart/ui/view/emptyView.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../enums/viewstate.dart';
import '../../locator.dart';
import '../../services/api.dart';
import 'base_view.dart';

class BranchView extends StatefulWidget {
  _BrancViewState createState() => _BrancViewState();
}

class _BrancViewState extends State<BranchView> {
  Api _api = locator<Api>();
  String _valueKota;
  //Future<void> _launched;
  List<KotaModel> dataKotaModelList = List();

  Future<String> getKotaList(BuildContext context) async {
    var responseKota = await _api.getKota(context);
    setState(() {
      dataKotaModelList = responseKota;
    });
    return "Success";
  }

  static Future<void> opengooglemap(double lat, double lon) async {
    //final url = 'http://maps.google.com/maps?q=loc:${lat},${lon}(${tag})';
    final url = 'http://www.google.com/maps/search/?api=1&query=$lat,$lon';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    getKotaList(context);
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<BranchViewModel>(
      onModelReady: (model) => model.getDataBranchdetail(context, _valueKota),
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
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 6,
                        child: Container(
                          padding: EdgeInsets.only(right: 10, left: 10),
                          decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              isExpanded: true,
                              hint: new Text(
                                "Pilih Kota",
                                style: TextStyle(fontSize: 12),
                              ),
                              items: dataKotaModelList.map((item) {
                                return new DropdownMenuItem(
                                  value: item.kotaID.toString() != null
                                      ? item.kotaID.toString()
                                      : "",
                                  child: new Text(
                                    item.kotaNAME != null ? item.kotaNAME : "",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newVal) {
                                setState(() {
                                  FocusScope.of(context)
                                      .requestFocus(new FocusNode());
                                  _valueKota = newVal;
                                  // dataKotaList.clear();
                                  // dataKecamatanList.clear();
                                  // dataKelurahanList.clear();
                                  // listKodePos.clear();
                                  // _valueKota = null;
                                  // _valueKecamatan = null;
                                  // _valueKelurahan = null;
                                  // _valueKodePos = null;
                                  // getKotaList(_valueProvinsi, context);
                                });
                              },
                              value: _valueKota,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: InkWell(
                              onTap: () async {
                                if (_valueKota == null) {
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        "Silahkan Pilih Kota terlebih dahulu"),
                                  ));
                                } else {
                                  model.getDataBranchdetail(
                                      context, _valueKota);
                                }
                                //print(_valueKota);
                              },
                              child: Icon(
                                FontAwesomeIcons.search,
                                color: Hexcolor("#0d306b"),
                                size: 24,
                              )),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  // model.dataDetailBranch.isEmpty thank bang
                  //     ? EmptyView
                  //     :
                  _valueKota == null
                      ? Container()
                      : model.dataDetailBranch == null
                          ? Center(
                              child: Container(),
                            )
                          : model.dataDetailBranch.isEmpty
                              ? EmptyView()
                              : (ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: model.dataDetailBranch.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Card(
                                      child: GestureDetector(
                                        onTap: () {
                                          print("masuk sini");
                                          var lat = double.parse(model
                                              .dataDetailBranch[index].lat);
                                          var lng = double.parse(model
                                              .dataDetailBranch[index].lng);
                                          // MapsLauncher.launchCoordinates(
                                          //     lat,
                                          //     lng,
                                          //     '${model.dataDetailBranch[index].tagName}')
                                          opengooglemap(lat, lng);
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.only(
                                              top: 10,
                                              right: 10,
                                              left: 10,
                                              bottom: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                model.dataDetailBranch[index]
                                                    .officeName,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black54,
                                                    fontSize: 14),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                model.dataDetailBranch[index]
                                                    .address,
                                                style: TextStyle(
                                                  //fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                padding:
                                                    EdgeInsets.only(top: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: <Widget>[
                                                    Text(
                                                      "View Location",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Hexcolor(
                                                              "#0d306b"),
                                                          fontSize: 12),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Icon(
                                                      FontAwesomeIcons
                                                          .chevronCircleRight,
                                                      color:
                                                          Hexcolor("#0d306b"),
                                                      size: 12,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ))
                  // Container(
                  //   child: DropdownButton(
                  //     isExpanded: true,
                  //     hint: new Text(
                  //       "Pilih Provinsi",
                  //       style: TextStyle(fontSize: 12),
                  //     ),
                  //     items: dataKotaModelList.map((item) {
                  //       return new DropdownMenuItem(
                  //         value: item.kotaID.toString() != null
                  //             ? item.kotaID.toString()
                  //             : "",
                  //         child: new Text(
                  //           item.kotaNAME != null ? item.kotaNAME : "",
                  //           maxLines: 1,
                  //           overflow: TextOverflow.ellipsis,
                  //           style: TextStyle(fontSize: 12),
                  //         ),
                  //       );
                  //     }).toList(),
                  //     onChanged: (newVal) {
                  //       setState(() {
                  //         FocusScope.of(context)
                  //             .requestFocus(new FocusNode());
                  //         // _valueProvinsi = newVal;
                  //         // dataKotaList.clear();
                  //         // dataKecamatanList.clear();
                  //         // dataKelurahanList.clear();
                  //         // listKodePos.clear();
                  //         // _valueKota = null;
                  //         // _valueKecamatan = null;
                  //         // _valueKelurahan = null;
                  //         // _valueKodePos = null;
                  //         // getKotaList(_valueProvinsi, context);
                  //       });
                  //     },
                  //     value: _valueKota,
                  //   ),
                  // ),
                  // Container(
                  //   height: 50,
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //       color: Hexcolor("#0d306b"),
                  //       borderRadius:
                  //           BorderRadius.all(Radius.circular(5))),
                  //   child: Center(
                  //       child: Text(
                  //     "Search",
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 15,
                  //     ),
                  //   )),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:sufismart/ViewModel/ProductViewModel.dart';
import 'package:sufismart/enums/viewstate.dart';
//import 'package:sufismart/model/producttype_model.dart';
import 'package:sufismart/ui/view/base_view.dart';
import 'package:sufismart/ui/view/indexpage_view.dart';
import 'package:sufismart/ui/view/productType_view.dart';

// ignore: must_be_immutable
class ProductListView extends StatefulWidget {
  String categoryproduct;
  ProductListView({Key key, this.categoryproduct});
  @override
  _ProductListViewState createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<ProductViewModel>(
      onModelReady: (model) =>
          model.getDataProductList(context, widget.categoryproduct),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Color(0XFFEEEEEE),
        appBar: AppBar(
          title: //Text("Suzuki Finance Indonesia"),
              Image.asset(
            'assets/images/logo_sfi_white.png',
            fit: BoxFit.cover,
            height: 30,
          ),
          backgroundColor: Hexcolor("#0d306b"),
          automaticallyImplyLeading: true,
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
            child: model.productList == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : RefreshIndicator(
                    onRefresh: () async {
                      model.getDataProductList(context, widget.categoryproduct);
                    },
                    child: SingleChildScrollView(
                      child: Container(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: model.productList.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        //tampilin toast
                                        // Scaffold.of(context).showSnackBar(SnackBar(
                                        //   content: Text("Id -> " +
                                        //       model.productList[index].productCode),
                                        // ));
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductTypeView(
                                                productCode: model
                                                    .productList[index]
                                                    .productCode,
                                                productImage: model
                                                    .productList[index]
                                                    .productImage,
                                              ),
                                            ));
                                      },
                                      child: Card(
                                        child: Column(
                                          children: <Widget>[
                                            model.productList[index]
                                                        .productImage ==
                                                    null
                                                ? Container(
                                                    //height: MediaQuery.of(context).size.height / 4,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 190,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  5)),
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              "assets/images/logo_suzuki.png"),
                                                          fit: BoxFit.fill),
                                                    ),
                                                  )
                                                : CachedNetworkImage(
                                                    imageUrl: model
                                                        .productList[index]
                                                        .productImage,
                                                    imageBuilder: (context,
                                                            imageProvider) =>
                                                        Container(
                                                      //height: MediaQuery.of(context).size.height / 4,
                                                      //height: 190,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height: 190,
                                                      margin:
                                                          const EdgeInsets.only(
                                                              bottom: 5.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5)),
                                                          image: DecorationImage(
                                                              image:
                                                                  imageProvider,
                                                              fit: BoxFit.fill),
                                                        ),
                                                      ),
                                                    ),
                                                    placeholder: (context,
                                                            url) =>
                                                        new SkeletonAnimation(
                                                            child: Container(
                                                      //height: MediaQuery.of(context).size.height / 4,
                                                      //height: 190,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height: 190,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Colors.grey[300],
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5))),
                                                    )),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            new Container(
                                                      //height: MediaQuery.of(context).size.height / 4,
                                                      //height: 190,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height: 190,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Colors.grey[300],
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5))),
                                                      child: Center(
                                                        child:
                                                            Icon(Icons.error),
                                                      ),
                                                    ),
                                                  ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              //text kepanjangan jadi titik-titik
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              padding: const EdgeInsets.only(
                                                  left: 10.0, bottom: 5.0),
                                              child: Text(
                                                model.productList[index]
                                                    .productName,
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blue[900]),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Container(
                                              //text kepanjangan jadi titik-titik
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              padding: const EdgeInsets.only(
                                                  top: 0.0,
                                                  bottom: 10.0,
                                                  right: 10.0,
                                                  left: 10.0),
                                              // child: Text(
                                              //   model.productList[index].productCategory,
                                              //   style: TextStyle(
                                              //       fontSize: 14,
                                              //       fontWeight: FontWeight.bold,
                                              //       color: Colors.black38
                                              //   ),
                                              //   maxLines: 2,
                                              //   overflow: TextOverflow.ellipsis,
                                              // ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Container(
                                                    child: Text(
                                                      model.productList[index]
                                                          .productCategory,
                                                      style: TextStyle(
                                                          color: Colors.black38,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  // Expanded(
                                                  //   flex: 1,
                                                  //    child: Align(
                                                  //      alignment: Alignment.topRight,
                                                  //      child:Container(
                                                  //       padding: EdgeInsets.all(5),
                                                  //       child: Text(
                                                  //       "Dimulai Dari "+model.productList[index].productPrice,
                                                  //       style: TextStyle(
                                                  //           color: Colors.black38,
                                                  //           fontSize: 16,
                                                  //           fontWeight: FontWeight.bold),
                                                  //     ),
                                                  //      )

                                                  //    ),
                                                  // ),
                                                  Container(
                                                    child: Align(
                                                      alignment:
                                                          Alignment.bottomRight,
                                                      child: Container(
                                                          padding:
                                                              EdgeInsets.all(5),
                                                          // decoration: BoxDecoration(
                                                          //     color: Color(0xff0d306b),
                                                          //     borderRadius: BorderRadius.all(
                                                          //         Radius.circular(20))),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: <Widget>[
                                                              Text(
                                                                "Dimulai Dari ",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        15),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                              Text(
                                                                model
                                                                    .productList[
                                                                        index]
                                                                    .productPrice,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ],
                                                          )),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          )),
                    ),
                  )),
      ),
    );
  }
}

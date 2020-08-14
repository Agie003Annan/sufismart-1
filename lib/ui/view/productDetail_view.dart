

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:sufismart/ui/view/WebView.dart';

class ProductDetailView extends StatefulWidget {
  String productDCode,
      productDImage,
      productDname,
      productDprice,
      prodType,
      prodCategory,
      prodName,
      prodCode,
      prodCategoryCode;
  ProductDetailView({
    Key key,
    this.productDCode,
    this.productDImage,
    this.productDname,
    this.productDprice,
    this.prodType,
    this.prodCategory,
    this.prodName,
    this.prodCode,
    this.prodCategoryCode,
  });
  @override
  _ProductDetailViewState createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFEEEEEE),
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Card(
                child: Column(
                  children: <Widget>[
                    widget.productDImage == null
                        ? Container(
                            //height: MediaQuery.of(context).size.height / 3.5,
                            height: 230,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/logo_sfi_white.png"),
                                  fit: BoxFit.fill),
                            ),
                          )
                        : CachedNetworkImage(
                            imageUrl: widget.productDImage,
                            imageBuilder: (context, imageProvider) => Container(
                              //height: MediaQuery.of(context).size.height / 3.5,
                              height: 230,
                              child: Card(
                                margin: const EdgeInsets.only(bottom: 5.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    image: DecorationImage(
                                        image: imageProvider, fit: BoxFit.fill),
                                  ),
                                ),
                              ),
                            ),
                            placeholder: (context, url) =>
                                new SkeletonAnimation(
                                    child: Container(
                              //height: MediaQuery.of(context).size.height / 3.5,
                              height: 230,
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            )),
                            errorWidget: (context, url, error) => new Container(
                              //height: MediaQuery.of(context).size.height / 3,
                              height: 230,
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Center(
                                child: Icon(Icons.error),
                              ),
                            ),
                          ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(
                          top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
                      child: Text(
                        widget.productDname,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Hexcolor("#0d306b")),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    // Container(
                    //   width: 80,
                    //   padding: EdgeInsets.all(5),
                    //   decoration: BoxDecoration(
                    //       color: Color(0xff0d306b),
                    //       borderRadius: BorderRadius.all(
                    //           Radius.circular(20))),
                    //   child: Text(
                    //     "Show All",
                    //     style: TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 12),
                    //     textAlign: TextAlign.center,
                    //   ),
                    // ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                          alignment: Alignment.topLeft,
                          //width: 150,
                          width: MediaQuery.of(context).size.width / 1,
                          margin: EdgeInsets.only(
                              top: 5, left: 10.0, right: 10.0, bottom: 10.0),
                          padding: EdgeInsets.only(
                              top: 5, left: 10.0, right: 10.0, bottom: 10.0),
                          decoration: BoxDecoration(
                            color: Color(0xff0d306b),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.only(top: 5),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Rp. " +
                                      FlutterMoneyFormatter(
                                              amount: double.parse(
                                                  widget.productDprice))
                                          .output
                                          .withoutFractionDigits
                                          .toString(),
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          )),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(
                          top: 5.0, left: 10.0, right: 10.0, bottom: 10.0),
                      child: Text(
                        "* Harga sewaktu-waktu dapat berubah tanpa pemberitahuan terlebih dahulu",
                        style:
                            TextStyle(fontSize: 14, color: Hexcolor("#0d306b")),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(
                          top: 20.0, left: 10.0, right: 10.0, bottom: 10.0),
                      child: Text(
                        "Deskripsi",
                        style: TextStyle(fontSize: 20, color: Hexcolor("#0d306b")),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(
                          top: 5.0, left: 10.0, right: 10.0, bottom: 10.0),
                      child: Text(
                        "Silahkan Kunjungi https://www.suzuki.co.id",
                        style:
                            TextStyle(fontSize: 13, color: Hexcolor("#0d306b")),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   margin: EdgeInsets.only(
                    //       top: 5.0, left: 10.0, right: 10.0, bottom: 10.0),
                    //   child: Text(
                    //     widget.prodType,
                    //     style:
                    //         TextStyle(fontSize: 13, color: Hexcolor("#0d306b")),
                    //     textAlign: TextAlign.left,
                    //   ),
                    // ),
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   margin: EdgeInsets.only(
                    //       top: 5.0, left: 10.0, right: 10.0, bottom: 10.0),
                    //   child: Text(
                    //     widget.prodCategory,
                    //     style:
                    //         TextStyle(fontSize: 13, color: Hexcolor("#0d306b")),
                    //     textAlign: TextAlign.left,
                    //   ),
                    // ),
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   margin: EdgeInsets.only(
                    //       top: 5.0, left: 10.0, right: 10.0, bottom: 10.0),
                    //   child: Text(
                    //     widget.prodName,
                    //     style:
                    //         TextStyle(fontSize: 13, color: Hexcolor("#0d306b")),
                    //     textAlign: TextAlign.left,
                    //   ),
                    // ),
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   margin: EdgeInsets.only(
                    //       top: 5.0, left: 10.0, right: 10.0, bottom: 10.0),
                    //   child: Text(
                    //     widget.prodCategoryCode,
                    //     style:
                    //         TextStyle(fontSize: 13, color: Hexcolor("#0d306b")),
                    //     textAlign: TextAlign.left,
                    //   ),
                    // ),
                  ],
                ),
              ),
              InkWell(
                onTap: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebView2(
                            linkurl:
                                "https://sufismart.sfi.co.id/sufismart/api/credit_simulation4.php?prod_code=${widget.prodCode}&detail_code=${widget.productDCode}"),
                      ));
                },
                child: Card(
                  color: Hexcolor("#0d306b"),
                  margin: EdgeInsets.only(left: 20, top: 5, right: 3),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                                top: 20.0,
                                left: 10.0,
                                right: 10.0,
                                bottom: 10.0),
                            child: Text(
                              "Simulasi Kredit",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: 20.0,
                                left: 10.0,
                                right: 10.0,
                                bottom: 10.0),
                            // child: Text(
                            //   ">",
                            //   style:
                            //       TextStyle(fontSize: 20, color: Colors.black),
                            //   textAlign: TextAlign.left,
                            // ),
                            child: Icon(Icons.arrow_forward_ios,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(
                            top: 5.0, left: 10.0, right: 10.0, bottom: 10.0),
                        child: Text(
                          "Hitung Cicilan Produk ini",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
              // Card(
              //     child:Container(
              //       width: MediaQuery.of(context).size.width,
              //       margin: EdgeInsets.only(
              //           top: 10.0,
              //           left: 10.0,
              //           right: 10.0,
              //           bottom: 10.0),
              //       child: Text(
              //         "Product Type ",
              //         style: TextStyle(
              //             fontSize: 18,
              //             fontWeight: FontWeight.bold,
              //             color: Colors.black),
              //         textAlign: TextAlign.left,
              //       ),
              //     ),
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}

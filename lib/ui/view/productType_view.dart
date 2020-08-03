import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:sufismart/ViewModel/ProductViewModel.dart';
import 'package:sufismart/enums/viewstate.dart';
import 'package:sufismart/ui/view/base_view.dart';
import 'package:sufismart/ui/view/productDetail_view.dart';

class ProductTypeView extends StatefulWidget {
  String productCode, productImage;
  ProductTypeView({Key key, this.productCode, this.productImage});
  @override
  _ProductTypeViewState createState() => _ProductTypeViewState();
}

class _ProductTypeViewState extends State<ProductTypeView> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<ProductViewModel>(
      onModelReady: (model) =>
          model.getDataProductType(context, widget.productCode),
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
          automaticallyImplyLeading: false,
        ),
        body: ModalProgressHUD(
          inAsyncCall: model.state == ViewState.Busy ?? ViewState.Idle,
          child: model.productType == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: () async {
                    model.getDataProductType(context, widget.productCode);
                  },
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        children: <Widget>[
                          widget.productImage == null
                              ? Container(
                                  height:
                                      MediaQuery.of(context).size.height / 3.5,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/image_default.jpg"),
                                        fit: BoxFit.fill),
                                  ),
                                )
                              : CachedNetworkImage(
                                  imageUrl: widget.productImage,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    height:
                                        MediaQuery.of(context).size.height / 3.5,
                                    child: Card(
                                      margin:
                                          const EdgeInsets.only(bottom: 5.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) =>
                                      new SkeletonAnimation(
                                          child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 3.5,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                  )),
                                  errorWidget: (context, url, error) =>
                                      new Container(
                                    height:
                                        MediaQuery.of(context).size.height / 3.5,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Center(
                                      child: Icon(Icons.error),
                                    ),
                                  ),
                                ),
                          Card(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(
                                  top: 10.0,
                                  left: 10.0,
                                  right: 10.0,
                                  bottom: 10.0),
                              child: Text(
                                "Product Type ",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Container(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: model.productType.length,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    //tampilin toast
                                    // Scaffold.of(context).showSnackBar(SnackBar(
                                    //   content: Text("Id -> " +
                                    //       model.productType[index]
                                    //           .productDetailImage),
                                    // ));
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProductDetailView(
                                            productDCode: model
                                                .productType[index]
                                                .productDetailCode,
                                            productDImage: model
                                                .productType[index]
                                                .productDetailImage,
                                            productDname: model
                                                .productType[index]
                                                .productDetailName,
                                            productDprice: model
                                                .productType[index]
                                                .productDetailPrice,
                                            prodType: model.productType[index].prodType,
                                            prodCategory: model.productType[index].productCategory,
                                            prodName: model.productType[index].productName,
                                            prodCode: widget.productCode,
                                            prodCategoryCode: model.productType[index].productCategoryCode,
                                          ),
                                        ));
                                  },
                                  child: Card(
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          //text kepanjangan jadi titik-titik
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: const EdgeInsets.only(
                                              top: 10.0,
                                              bottom: 10.0,
                                              right: 5.0,
                                              left: 5.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.all(5),
                                                child: Text(
                                                  model.productType[index]
                                                      .productDetailName,
                                                  style: TextStyle(
                                                    color: Hexcolor("#0d306b"),
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(5),
                                                child: Text(
                                                   "Rp. "+FlutterMoneyFormatter(amount: double.parse(model.productType[index].productDetailPrice)).output.withoutFractionDigits.toString(), 
                                                  
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(
                                top: 10.0,
                                left: 10.0,
                                right: 10.0,
                                bottom: 10.0),
                            child: Text(
                              "* Daftar Harga Diatas Menggunakan OTR Jakarta",
                              style: TextStyle(
                                  fontSize: 13, color: Hexcolor("#0d306b")),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          // Text(
                          //   "* Daftar Harga Diatas Menggunakan OTR Jakarta",
                          //   style: TextStyle(
                          //     color:  Hexcolor("#0d306b"),
                          //     fontSize: 16,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

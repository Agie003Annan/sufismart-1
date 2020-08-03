import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:sufismart/ViewModel/HomeViewModel.dart';
import 'package:sufismart/ViewModel/ProductViewModel.dart';
import 'package:sufismart/enums/viewstate.dart';
import 'package:sufismart/ui/view/WebView.dart';
import 'package:sufismart/ui/view/about_view.dart';
import 'package:sufismart/ui/view/base_view.dart';
import 'package:sufismart/ui/view/branch_view.dart';
import 'package:sufismart/ui/view/news_view.dart';
import 'package:sufismart/ui/view/product_view.dart';
import 'package:sufismart/ui/view/promo_view.dart';
import 'package:sufismart/ui/view/statuskontrak_view.dart';
import 'package:sufismart/ui/view/testWebView.dart';

import 'news_detail_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = PageController(viewportFraction: 0.8);

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (model) => model.getAll(context),
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
        ),
        body: ModalProgressHUD(
          inAsyncCall: model.state == ViewState.Busy ?? ViewState.Idle,
          child: model.banner == null || model.imgNews == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: () async {
                    model.getAll(context);
                  },
                  child: SingleChildScrollView(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          //header
                          // Container(
                          //   padding: EdgeInsets.only(top:50, left: 30, right: 30, bottom: 30),
                          //   //height: 100,
                          //   decoration: BoxDecoration(
                          //       gradient: const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter,colors: [
                          //         Color(0xff0d306b),
                          //         Colors.indigo,
                          //       ]),
                          //       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50))
                          //   ),
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.start,
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: <Widget>[
                          //       Row(
                          //         children: <Widget>[
                          //           Expanded(
                          //             flex: 3,
                          //             child: Text(
                          //               "Welcome,",
                          //               style: TextStyle(
                          //                 color: Colors.white,
                          //                 fontSize: 20,
                          //                 fontWeight: FontWeight.w600
                          //               ),
                          //             ),
                          //           ),
                          //           Expanded(
                          //             flex: 1,
                          //             child: Row(
                          //               mainAxisAlignment: MainAxisAlignment.end,
                          //               children: <Widget>[
                          //                 Icon(
                          //                   FontAwesomeIcons.userCircle,
                          //                   color: Colors.white,
                          //                 ),
                          //                 SizedBox(width: 10,),
                          //                 Icon(
                          //                   FontAwesomeIcons.bell,
                          //                   color: Colors.white,
                          //                 )
                          //               ],
                          //             ),
                          //           )
                          //         ],
                          //       ),
                          //       Text(
                          //         "Dear",
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontSize: 28,
                          //             fontWeight: FontWeight.w900
                          //         ),
                          //         overflow: TextOverflow.ellipsis,
                          //         maxLines: 1,
                          //       ),
                          //       SizedBox(height: 5,),
                          //       Text(
                          //         "Choose Suzuki Finance Indonesia \nfor your Suzuki credit",
                          //         //"Pilih Suzuki Finance Indonesia \nUntuk kenyamanan kredit Suzuki anda",
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //           fontSize: 12
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          //slider
                          Container(
                            // height: 200,
                            height: MediaQuery.of(context).size.height / 3.5,
                            child: Swiper(
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color(0xffeeeeee), width: 1.0),
                                    //borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: model.banner[index].imagepath == null
                                      ? Container(
                                          height: 160,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
                                            // borderRadius: BorderRadius.all(
                                            //     Radius.circular(10)),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/image_default.jpg"),
                                                fit: BoxFit.fill),
                                          ),
                                        )
                                      : CachedNetworkImage(
                                          imageUrl:
                                              model.banner[index].imagepath,
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            height: 160,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
                                              // borderRadius: BorderRadius.all(
                                              //     Radius.circular(15)),
                                              image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                          placeholder: (context, url) =>
                                              new SkeletonAnimation(
                                                  child: Container(
                                            height: 160,
                                            decoration: BoxDecoration(
                                                color: Colors.grey[300],
                                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
                                                    ,),
                                          )),
                                          errorWidget: (context, url, error) =>
                                              new Container(
                                            height: 160,
                                            decoration: BoxDecoration(
                                                color: Colors.grey[300],
                                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
                                                // borderRadius: BorderRadius.all(
                                                //     Radius.circular(10))
                                                    ,),
                                            child: Center(
                                              child: Icon(Icons.error),
                                            ),
                                          ),
                                        ),
                                );
                              },
                              itemCount: model.banner.length,
                              pagination: new SwiperPagination(
                                alignment: Alignment.bottomRight,
                                margin: EdgeInsets.only(right: 30, bottom: 10),
                              ),
                              //control: new SwiperControl(),
                              autoplay: true,
                              duration: 3,
                              containerHeight: 180,
                            ),
                          ),

                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(50)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // Text(
                                //   "Features",
                                //   style: TextStyle(
                                //       color: Color(0xff0d306b),
                                //       fontSize: 16,
                                //       fontWeight: FontWeight.bold),
                                // ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //       builder: (context) =>
                                          //           WebView(linkurl: "https://sufismart.sfi.co.id/sufismart/api/promo.php"),
                                          //     ));
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    NewsView(),
                                              ));
                                        },
                                        child: Container(
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Image.network(
                                                  "https://www.sfi.co.id/assets/images/menu/Icon-Promo.png",
                                                  width: 60,
                                                  height: 60,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Promo\n",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductCategory(),
                                              ));
                                        },
                                        child: Container(
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Image.network(
                                                  "https://www.sfi.co.id/assets/images/menu/ic_menu/product.png",
                                                  width: 60,
                                                  height: 60,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text("Product\n",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                    textAlign: TextAlign.center)
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: (){
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //       builder: (context) =>
                                          //           WebView2(linkurl: "https://sufismart.sfi.co.id/sufismart/api/branch.php"),
                                          //     ));
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      BranchView()));
                                        },
                                        child: Container(
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Image.network(
                                                  "https://www.sfi.co.id/assets/images/menu/ic_menu/dealerservice.png",
                                                  width: 60,
                                                  height: 60,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text("Cabang\n",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                    textAlign: TextAlign.center)
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: (){
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => WebView2(
                                                    linkurl:
                                                        "https://sufismart.sfi.co.id/sufismart/api/credit_simulation2.php"),
                                              ));
                                        },
                                        child: Container(
                                          child: Center(
                                            child: Column(
                                              children: <Widget>[
                                                Image.network(
                                                  "https://www.sfi.co.id/assets/images/menu/ic_menu/creditsimulation.png",
                                                  width: 60,
                                                  height: 60,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Simulasi\nKredit",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    StatusKontrakView(),
                                              ));
                                        },
                                        child: Container(
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Image.network(
                                                  "https://www.sfi.co.id/assets/images/menu/ic_menu/inststat.png",
                                                  width: 60,
                                                  height: 60,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Status\nKontrak",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    //  WebView(linkurl: "https://sufismart.sfi.co.id/sufismart/api/layanan.php"),
                                                    TestWebView(),
                                              ));
                                        },
                                        child: Container(
                                          child: Center(
                                            child: Column(
                                              children: <Widget>[
                                                Image.network(
                                                  "https://www.sfi.co.id/assets/images/menu/Icon-Layanan.png",
                                                  width: 60,
                                                  height: 60,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Pembayaran &\n Asuransi",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(),
                                SizedBox(
                                  height: 10,
                                ),
                                // Row(
                                //   children: <Widget>[
                                //     Expanded(
                                //       flex: 1,
                                //       child: Text(
                                //         "Promo",
                                //         style: TextStyle(
                                //             color: Color(0xff0d306b),
                                //             fontSize: 16,
                                //             fontWeight: FontWeight.bold),
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 1,
                                //       child: Align(
                                //         alignment: Alignment.topRight,
                                //         child: InkWell(
                                //           onTap: (){
                                //              Navigator.push(
                                //               context,
                                //               MaterialPageRoute(
                                //                 builder: (context) =>
                                //                 PromoView(),
                                //               ));
                                //           },
                                //           child: Container(
                                //             width: 80,
                                //             padding: EdgeInsets.all(5),
                                //             decoration: BoxDecoration(
                                //                 color: Color(0xff0d306b),
                                //                 borderRadius: BorderRadius.all(
                                //                     Radius.circular(20))),
                                //             child: Text(
                                //               "Show All",
                                //               style: TextStyle(
                                //                   color: Colors.white,
                                //                   fontSize: 12),
                                //               textAlign: TextAlign.center,
                                //             ),
                                //           ),
                                //         ),
                                //       ),
                                //     )
                                //   ],
                                // ),
                                // Container(
                                //   padding: EdgeInsets.symmetric(vertical: 10.0),
                                //   height: MediaQuery.of(context).size.height * 0.33,
                                //   color: Colors.transparent,
                                //   child: ListView.builder(
                                //     shrinkWrap: true,
                                //     itemCount: model.imgPromo.length,
                                //     scrollDirection: Axis.horizontal,
                                //     itemBuilder: (context, index) {
                                //       return InkWell(
                                //         onTap: () {
                                //           // Navigator.push(
                                //           //     context,
                                //           //     MaterialPageRoute(
                                //           //       builder: (context) =>
                                //           //           ProductCategoryView(
                                //           //         categoryId: model
                                //           //             .category[index]
                                //           //             .category_id
                                //           //             .toString(),
                                //           //         categoryName: model
                                //           //             .category[index]
                                //           //             .category_name,
                                //           //       ),
                                //           //     ));
                                //         },
                                //         child: Container(
                                //           child: Column(
                                //             children: <Widget>[
                                //               model.imgPromo[index].imagepath == null ?
                                //               Container(
                                //                 width: MediaQuery.of(context).size.width * 0.6,
                                //                 height: MediaQuery.of(context).size.height * 0.30,
                                //                 decoration: BoxDecoration(
                                //                   borderRadius: BorderRadius.all(Radius.circular(5)),
                                //                   image: DecorationImage(
                                //                       image: AssetImage("assets/images/image_default.jpg"), fit: BoxFit.cover),
                                //                 ),
                                //               ) : CachedNetworkImage(
                                //                 imageUrl: model.imgPromo[index].imagepath,
                                //                 imageBuilder: (context, imageProvider) => Container(
                                //                     width: MediaQuery.of(context).size.width * 0.6,
                                //                     height: MediaQuery.of(context).size.height * 0.30,
                                //                     child: Card(
                                //                       child: Container(
                                //                         height: 60,
                                //                         width: 30,
                                //                         decoration: BoxDecoration(
                                //                           borderRadius: BorderRadius.all(Radius.circular(5)),
                                //                           image: DecorationImage(
                                //                               image: imageProvider, fit: BoxFit.fill),
                                //                         ),
                                //                         // decoration: BoxDecoration(
                                //                         //   color: Colors.green,
                                //                         //   borderRadius: BorderRadius.all(
                                //                         //     Radius.circular(5),
                                //                         //   ),
                                //                         //   image: DecorationImage(
                                //                         //     image: NetworkImage(
                                //                         //         "https://www.sfi.co.id/assets/images/news/Brosur-PRIME-CUSTOMER-Action-Figure.jpg"),
                                //                         //     fit: BoxFit.fill,
                                //                         //   ),
                                //                         // ),
                                //                       ),
                                //                     ),
                                //                 ),
                                //                 placeholder: (context, url) => new SkeletonAnimation(
                                //                     child: Container(
                                //                      width: MediaQuery.of(context).size.width * 0.6,
                                //                      height: MediaQuery.of(context).size.height * 0.30,
                                //                       decoration: BoxDecoration(
                                //                           color: Colors.grey[300],
                                //                           borderRadius: BorderRadius.all(Radius.circular(50))
                                //                       ),
                                //                     )
                                //                 ),
                                //                 errorWidget: (context, url, error) => new Container(
                                //                   width: MediaQuery.of(context).size.width * 0.6,
                                //                   height: MediaQuery.of(context).size.height * 0.30,
                                //                   decoration: BoxDecoration(
                                //                       color: Colors.grey[300],
                                //                       borderRadius: BorderRadius.all(Radius.circular(50))
                                //                   ),
                                //                   child: Center(
                                //                     child: Icon(
                                //                         Icons.error
                                //                     ),
                                //                   ),
                                //                 ),
                                //               ),
                                //             ],
                                //           ),
                                //         ),
                                //       );
                                //     },
                                //   ),
                                // ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        "Berita Terkini",
                                        style: TextStyle(
                                            color: Color(0xff0d306b),
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      NewsView(),
                                                ));
                                          },
                                          child: Container(
                                            width: 80,
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                color: Color(0xff0d306b),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            child: Text(
                                              "Show All",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 10.0),
                                  height:
                                      MediaQuery.of(context).size.height * 0.33,
                                  color: Colors.transparent,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: model.imgNews.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => NewsDetail(
                                                detailNewsId:
                                                    model.imgNews[index].newsid,
                                                detailTitle:
                                                    model.imgNews[index].title,
                                                detailDate:
                                                    model.imgNews[index].newsdate,
                                                detailDesc: model.imgNews[index]
                                                    .desc,
                                                detailImg: model
                                                    .imgNews[index].imagepath),
                                          ));
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //       builder: (context) =>
                                          //           ProductCategoryView(
                                          //         categoryId: model
                                          //             .category[index]
                                          //             .category_id
                                          //             .toString(),
                                          //         categoryName: model
                                          //             .category[index]
                                          //             .category_name,
                                          //       ),
                                          //     ));
                                        },
                                        child: Container(
                                          child: Column(
                                            children: <Widget>[
                                              model.imgNews[index].imagepath ==
                                                      null
                                                  ? Container(
                                                      width:MediaQuery.of(context).size.width *0.6,
                                                      height:MediaQuery.of(context).size.height * 0.30,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5)),
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                "assets/images/image_default.jpg"),
                                                            fit: BoxFit.fill),
                                                      ),
                                                    )
                                                  : CachedNetworkImage(
                                                      imageUrl: model.imgNews[index].imagepath, 
                                                      imageBuilder: (context, imageProvider) => Container(
                                                        width: MediaQuery.of( context).size.width * 0.6,
                                                        height: MediaQuery.of(context).size.height * 0.30,
                                                        child: Card(
                                                          child: Container(
                                                            // height: 60,
                                                            // width: 30,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(Radius
                                                                          .circular(
                                                                              5)),
                                                              image: DecorationImage(
                                                                  image:
                                                                      imageProvider,
                                                                  fit: BoxFit
                                                                      .fill),
                                                            ),
                                                            // decoration: BoxDecoration(
                                                            //   color: Colors.green,
                                                            //   borderRadius: BorderRadius.all(
                                                            //     Radius.circular(5),
                                                            //   ),
                                                            //   image: DecorationImage(
                                                            //     image: NetworkImage(
                                                            //         "https://www.sfi.co.id/assets/images/news/Brosur-PRIME-CUSTOMER-Action-Figure.jpg"),
                                                            //     fit: BoxFit.fill,
                                                            //   ),
                                                            // ),
                                                          ),
                                                        ),
                                                      ),
                                                      placeholder: (context,
                                                              url) =>
                                                          new SkeletonAnimation(
                                                              child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.6,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.30,
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .grey[300],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5))),
                                                      )),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          new Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.6,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.30,
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .grey[300],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5))),
                                                        child: Center(
                                                          child:
                                                              Icon(Icons.error),
                                                        ),
                                                      ),
                                                    ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                // Container(
                                //   padding: EdgeInsets.symmetric(vertical: 10.0),
                                //   height:
                                //       MediaQuery.of(context).size.height * 0.29,
                                //   color: Colors.transparent,
                                //   child: ListView(
                                //     children: List.generate(5, (i) {
                                //       return listImageNews(context);
                                //     }),
                                //     scrollDirection: Axis.horizontal,
                                //   ),
                                // ),
                                // ListView.builder(
                                //     shrinkWrap: true,
                                //     itemCount: 5,
                                //     controller: ScrollController(
                                //         keepScrollOffset: false),
                                //     itemBuilder: (BuildContext context,
                                //             int index) =>
                                //         Container(
                                //           child: Column(
                                //             mainAxisAlignment:
                                //                 MainAxisAlignment.start,
                                //             crossAxisAlignment:
                                //                 CrossAxisAlignment.start,
                                //             children: <Widget>[
                                //               Row(
                                //                 mainAxisAlignment:
                                //                     MainAxisAlignment.start,
                                //                 crossAxisAlignment:
                                //                     CrossAxisAlignment.start,
                                //                 children: <Widget>[
                                //                   CachedNetworkImage(
                                //                     imageUrl:
                                //                         "https://www.sfi.co.id/assets/images/banner/1568254397.png",
                                //                     imageBuilder: (context,
                                //                             imageProvider) =>
                                //                         Container(
                                //                       height: 80,
                                //                       width: 100,
                                //                       decoration: BoxDecoration(
                                //                         borderRadius:
                                //                             BorderRadius.all(
                                //                                 Radius.circular(
                                //                                     10)),
                                //                         image: DecorationImage(
                                //                             image:
                                //                                 imageProvider,
                                //                             fit: BoxFit.cover),
                                //                       ),
                                //                     ),
                                //                     placeholder: (context,
                                //                             url) =>
                                //                         new SkeletonAnimation(
                                //                             child: Container(
                                //                       height: 80,
                                //                       width: 100,
                                //                       margin:
                                //                           EdgeInsets.all(10),
                                //                       decoration: BoxDecoration(
                                //                           color:
                                //                               Colors.grey[300],
                                //                           borderRadius:
                                //                               BorderRadius.all(
                                //                                   Radius
                                //                                       .circular(
                                //                                           10))),
                                //                     )),
                                //                     errorWidget:
                                //                         (context, url, error) =>
                                //                             new Container(
                                //                       height: 80,
                                //                       width: 100,
                                //                       margin:
                                //                           EdgeInsets.all(10),
                                //                       decoration: BoxDecoration(
                                //                           color:
                                //                               Colors.grey[300],
                                //                           borderRadius:
                                //                               BorderRadius.all(
                                //                                   Radius
                                //                                       .circular(
                                //                                           10))),
                                //                       child: Center(
                                //                         child:
                                //                             Icon(Icons.error),
                                //                       ),
                                //                     ),
                                //                   ),
                                //                   SizedBox(
                                //                     width: 10,
                                //                   ),
                                //                   Container(
                                //                     width:
                                //                         MediaQuery.of(context)
                                //                                 .size
                                //                                 .width -
                                //                             160,
                                //                     child: Column(
                                //                       mainAxisAlignment:
                                //                           MainAxisAlignment
                                //                               .start,
                                //                       crossAxisAlignment:
                                //                           CrossAxisAlignment
                                //                               .start,
                                //                       children: <Widget>[
                                //                         Text(
                                //                           "Lorem Ipsum",
                                //                           style: TextStyle(
                                //                               fontSize: 14,
                                //                               color: Color(
                                //                                   0xff0d306b),
                                //                               fontWeight:
                                //                                   FontWeight
                                //                                       .bold),
                                //                         ),
                                //                         SizedBox(
                                //                           height: 10,
                                //                         ),
                                //                         Text(
                                //                           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                //                           style: TextStyle(
                                //                               fontSize: 12,
                                //                               color:
                                //                                   Colors.grey),
                                //                           maxLines: 3,
                                //                           overflow: TextOverflow
                                //                               .ellipsis,
                                //                         )
                                //                       ],
                                //                     ),
                                //                   )
                                //                 ],
                                //               ),
                                //               SizedBox(
                                //                 height: 5,
                                //               ),
                                //               Divider(),
                                //               SizedBox(
                                //                 height: 5,
                                //               )
                                //             ],
                                //           ),
                                //         ))
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
    );
  }
}

// Widget listImageNews(BuildContext context) {
//   return Container(
//     width: MediaQuery.of(context).size.width * 0.7,
//     child: Card(
//       color: Colors.transparent,
//       child: Container(
//         height: 60,
//         width: 20,
//         decoration: BoxDecoration(
//           color: Colors.green,
//           borderRadius: BorderRadius.all(
//             Radius.circular(5),
//           ),
//           image: DecorationImage(
//             image: NetworkImage(
//                 "https://www.sfi.co.id/assets/images/news/Brosur-PRIME-CUSTOMER-Action-Figure.jpg"),
//             fit: BoxFit.fill,
//           ),
//         ),
//       ),
//     ),
//   );
// }

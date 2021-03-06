import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:sufismart/ViewModel/NewsViewModel.dart';
import 'package:sufismart/enums/viewstate.dart';
import 'package:sufismart/ui/view/base_view.dart';
import 'package:sufismart/ui/view/indexpage_view.dart';

import 'news_detail_view.dart';

class NewsView extends StatefulWidget {
  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  
  void initState() {
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return BaseView<NewsViewModel>(
      onModelReady: (model) => model.getDataNews(context),
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
          child: model.news == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: () async {
                    model.getDataNews(context);
                  },
                  child : SingleChildScrollView(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: model.news.length,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      //tampilin toast
                                      // Scaffold.of(context).showSnackBar(SnackBar(
                                      //   content: Text("Id -> " +
                                      //       model.news[index].newsid),
                                      // ));
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => NewsDetail(
                                                detailNewsId:
                                                    model.news[index].newsid,
                                                // detailTitle:
                                                //     model.news[index].newstitle,
                                                // detailDate:
                                                //     model.news[index].newsdate,
                                                // detailDesc: model.news[index]
                                                //     .newsdescription,
                                                // detailImg: model
                                                //     .news[index].newsimage
                                                    ),
                                          ));
                                    },
                                    child: Card(
                                      child: Column(
                                        children: <Widget>[
                                          model.news[index].newsimage == null
                                              ? Container(
                                                  // height: MediaQuery.of(context)
                                                  //         .size
                                                  //         .height /
                                                  //     2,
                                                  width: MediaQuery.of(context).size.width,
                                                  height: 400,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            "assets/images/logo_suzuki.png"),
                                                        fit: BoxFit.fill),
                                                  ),
                                                )
                                              : CachedNetworkImage(
                                                  imageUrl: model
                                                      .news[index].newsimage,
                                                  imageBuilder: (context,
                                                          imageProvider) =>
                                                      Container(
                                                    // height:
                                                    //     MediaQuery.of(context)
                                                    //             .size
                                                    //             .height /
                                                    //         2,
                                                    width: MediaQuery.of(context).size.width,
                                                    height: 400,
                                                    child: Card(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              bottom: 10.0),
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
                                                  ),
                                                  placeholder: (context, url) =>
                                                      new SkeletonAnimation(
                                                          child: Container(
                                                    // height:
                                                    //     MediaQuery.of(context)
                                                    //             .size
                                                    //             .height /
                                                    //         2,
                                                    width: MediaQuery.of(context).size.width,
                                                    height: 400,
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey[300],
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5))),
                                                  )),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          new Container(
                                                    // height:
                                                    //     MediaQuery.of(context)
                                                    //             .size
                                                    //             .height /
                                                    //         2,
                                                    width: MediaQuery.of(context).size.width,
                                                    height: 400,
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey[300],
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5))),
                                                    child: Center(
                                                      child: Icon(Icons.error),
                                                    ),
                                                  ),
                                                ),
                                          // SizedBox(
                                          //   height: 5,
                                          // ),
                                          // Container(
                                          //   //text kepanjangan jadi titik-titik
                                          //   margin: const EdgeInsets.only(
                                          //       bottom: 10.0,
                                          //       right: 5.0,
                                          //       left: 5.0),
                                          //   child: Text(
                                          //     model.news[index].newstitle,
                                          //     style: TextStyle(
                                          //         fontSize: 17,
                                          //         fontWeight: FontWeight.bold,
                                          //         color: Colors.blue[900]),
                                          //     maxLines: 2,
                                          //     textAlign: TextAlign.justify,
                                          //     overflow: TextOverflow.ellipsis,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                    // child: Card(
                                    //   margin: const EdgeInsets.only(bottom: 20.0),
                                    //   child: Padding(
                                    //     padding: const EdgeInsets.all(0.0),
                                    //     child: Container(
                                    //       child: Column(
                                    //         crossAxisAlignment: CrossAxisAlignment.start,
                                    //         children: <Widget>[
                                    //            model.news[index].newsimage== null ?
                                    //       Container(
                                    //         height: 200,
                                    //         width: 150,
                                    //         decoration: BoxDecoration(
                                    //           borderRadius: BorderRadius.all(Radius.circular(50)),
                                    //           image: DecorationImage(
                                    //               image: AssetImage("assets/images/image_default.jpg"), fit: BoxFit.fill),
                                    //         ),
                                    //       ) :
                                    //           Container(
                                    //             width: MediaQuery.of(context).size.width,
                                    //             child: Image.network(
                                    //                 "https://www.sfi.co.id/assets/images/news/" +
                                    //                     model.news[index].newsimage,
                                    //                 fit: BoxFit.cover),
                                    //           ),
                                    //           Container(
                                    //             //text kepanjangan jadi titik-titik

                                    //             padding: const EdgeInsets.all(10.0),
                                    //             child: Text(
                                    //               model.news[index].newstitle,
                                    //               style: TextStyle(
                                    //                   fontSize: 17,
                                    //                   fontWeight: FontWeight.bold,
                                    //                   color: Colors.blue[900]),
                                    //               maxLines: 2,
                                    //               overflow: TextOverflow.ellipsis,
                                    //             ),
                                    //           ),
                                    //         ],
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                  );
                                },
                              ),
                            )
                          ],
                        )),
                  ),
                ),
        ),
      ),
    );
  }
}

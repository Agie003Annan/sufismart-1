import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
//import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:skeleton_text/skeleton_text.dart';
//import 'package:sufismart/ViewModel/DetailNews_viewmodel.dart';
import 'package:sufismart/ViewModel/NewsViewModel.dart';
import 'package:sufismart/enums/viewstate.dart';
//import 'package:sufismart/model/news_detail_model.dart';
import 'package:sufismart/ui/view/base_view.dart';
import 'package:sufismart/ui/view/indexpage_view.dart';
//import 'package:sufismart/ViewModel/DetailNews_viewmodel.dart';
//import 'package:sufismart/enums/viewstate.dart';
//import 'package:sufismart/ui/view/base_view.dart';

class NewsDetail extends StatefulWidget {
  String detailNewsId;
  // String detailTitle;
  // String detailDate;
  // String detailDesc;
  // String detailImg;
  NewsDetail(
      {Key key,
      this.detailNewsId,
      // this.detailTitle,
      // this.detailDate,
      // this.detailDesc,
      // this.detailImg
      });

  @override
  _NewsDetailViewState createState() => _NewsDetailViewState();
}

class _NewsDetailViewState extends State<NewsDetail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<NewsViewModel>(
      onModelReady: (model) =>
          model.getDetailDataNews(context, widget.detailNewsId),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Color(0XFFEEEEEE),
        appBar: AppBar(
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
          child: model.dataDetailNews == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(3),
                    child: Column(children: <Widget>[
                      Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            CachedNetworkImage(
                              imageUrl: model.dataDetailNews.detailNewsImage,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                //height: MediaQuery.of(context).size.height / 2,
                                width: MediaQuery.of(context).size.width,
                                height: 400,
                                child: Card(
                                  margin: const EdgeInsets.only(bottom: 10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
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
                                //height: MediaQuery.of(context).size.height / 2,
                                width: MediaQuery.of(context).size.width,
                                height: 400,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              )),
                              errorWidget: (context, url, error) =>
                                  new Container(
                                //height: MediaQuery.of(context).size.height / 2,
                                height: 400,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: Center(
                                  child: Icon(Icons.error),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              //text kepanjangan jadi titik-titik
                              padding: EdgeInsets.only(left: 5),
                              margin: EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                model.dataDetailNews.detailNewsTitle,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[900]),
                                maxLines: 2,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  bottom: 10.0, right: 5.0, left: 5.0),
                              child: Html(
                                data: model.dataDetailNews.detailNewsDesc
                                // child: Text(
                                //   widget.detailDesc,
                                //   style: TextStyle(
                                //       fontSize: 12,
                                //       fontWeight: FontWeight.bold,
                                //       color: Colors.blue[900]),
                                //   textAlign: TextAlign.justify,
                                //   maxLines: 200000,
                                //   overflow: TextOverflow.ellipsis,
                                // ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
        ),
      ),
    );
  }
}

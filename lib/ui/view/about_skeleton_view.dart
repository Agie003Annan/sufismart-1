import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class AboutSkeletonView extends StatefulWidget {
  @override
  _AboutSkeletonViewState createState() => _AboutSkeletonViewState();
}

class _AboutSkeletonViewState extends State<AboutSkeletonView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: //Text("Suzuki Finance Indonesia"),
      //       Image.asset(
      //     'assets/images/logo_sfi_white.png',
      //     fit: BoxFit.cover,
      //     height: 30,
      //   ),
      //   backgroundColor: Hexcolor("#0d306b"),
      //   automaticallyImplyLeading: false,
      // ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              SkeletonAnimation(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(
                      Radius.circular(0),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 20),
                child: Column(children: <Widget>[
                  SkeletonAnimation(
                    child: Container(
                      height: 12,
                      //margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  SkeletonAnimation(
                    child: Container(
                      height: 12,
                      //margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                ]),
              ),
              Divider(),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 10),
                child: Column(children: <Widget>[
                  SkeletonAnimation(
                    child: Container(
                      height: 12,
                      //margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  SkeletonAnimation(
                    child: Container(
                      height: 12,
                      //margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                ]),
              ),
              Divider(),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 10),
                child: Column(children: <Widget>[
                  SkeletonAnimation(
                    child: Container(
                      height: 12,
                      //margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  SkeletonAnimation(
                    child: Container(
                      height: 12,
                      //margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                ]),
              ),
              Divider(),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 10),
                child: Column(children: <Widget>[
                  SkeletonAnimation(
                    child: Container(
                      height: 12,
                      //margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  SkeletonAnimation(
                    child: Container(
                      height: 12,
                      //margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                ]),
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: <Widget>[
              //       Container(
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: <Widget>[
              //             SkeletonAnimation(
              //               child: Container(
              //                 height: 30,
              //                 width: 220,
              //                 //margin: EdgeInsets.only(right: 20),
              //                 decoration: BoxDecoration(
              //                   color: Colors.grey[300],
              //                 ),
              //               ),
              //             ),
              //             SkeletonAnimation(
              //               child: Container(
              //                 height: 12,
              //                 //margin: EdgeInsets.only(right: 20),
              //                 decoration: BoxDecoration(
              //                   color: Colors.grey[300],
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       new Padding(
              //           padding: EdgeInsets.all(8.0), child: new Divider()),
              //       Container(
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: <Widget>[
              //             SkeletonAnimation(
              //               child: Container(
              //                 height: 12,
              //                 //margin: EdgeInsets.only(right: 20),
              //                 decoration: BoxDecoration(
              //                   color: Colors.grey[300],
              //                 ),
              //               ),
              //             ),
              //             SkeletonAnimation(
              //               child: Container(
              //                 height: 12,
              //                 //margin: EdgeInsets.only(right: 20),
              //                 decoration: BoxDecoration(
              //                   color: Colors.grey[300],
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       new Padding(
              //           padding: EdgeInsets.all(8.0), child: new Divider()),
              //       Container(
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: <Widget>[
              //             SkeletonAnimation(
              //               child: Container(
              //                 height: 12,
              //                 //margin: EdgeInsets.only(right: 20),
              //                 decoration: BoxDecoration(
              //                   color: Colors.grey[300],
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       new Padding(
              //           padding: EdgeInsets.all(8.0), child: new Divider()),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:sufismart/ViewModel/ProductViewModel.dart';
import 'package:sufismart/enums/viewstate.dart';
import 'package:sufismart/ui/view/base_view.dart';
import 'package:sufismart/ui/view/productList_view.dart';

class ProductCategory extends StatefulWidget{
  @override
  _ProductCategoryViewState createState() => _ProductCategoryViewState();
}

class _ProductCategoryViewState extends State<ProductCategory>{
  @override
  Widget build(BuildContext context) {    
   return BaseView<ProductViewModel>(
      onModelReady: (model) => model.getDataProduct(context),
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
          child: model.productCategory == null 
          ? Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: () async {
                    model.getDataProduct(context);
                  },
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: ListView.builder(shrinkWrap: true,
                                    itemCount: model.productCategory.length,
                                    physics: NeverScrollableScrollPhysics(),                                    
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          //tampilin toast
                                          // Scaffold.of(context).showSnackBar(SnackBar(
                                          //   content: Text("Id -> " +
                                          //       model.productCategory[index].categorycode),
                                          // ));
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductListView(categoryproduct:model.productCategory[index].categorycode),
                                              ));
                                        },
                                        child: Card(  
                                          child: Row(
                                            children: <Widget>[
                                              model.productCategory[index].categoryimage == null ?
                                              Container(
                                                width: 110,
                                                height: 110,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                                  image: DecorationImage(
                                                      image: AssetImage("assets/images/image_default.jpg"), fit: BoxFit.fill),
                                                ),
                                              ) : CachedNetworkImage(
                                                imageUrl: model.productCategory[index].categoryimage,
                                                imageBuilder: (context, imageProvider) => Container(
                                                    width: 110,
                                                    height: 110,                                                    
                                                      margin: const EdgeInsets.only(bottom: 10.0),                                                                                                                                                                         
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.all(Radius.circular(5)),
                                                            image: DecorationImage(
                                                                image: imageProvider, fit: BoxFit.fill),
                                                          ),
                                                        ),
                                                ),
                                                placeholder: (context, url) => new SkeletonAnimation(
                                                    child: Container(
                                                      //height: MediaQuery.of(context).size.height / 2,
                                                      width: 110,
                                                      height: 110, 
                                                      decoration: BoxDecoration(
                                                          color: Colors.grey[300],
                                                          borderRadius: BorderRadius.all(Radius.circular(5))
                                                      ),
                                                    )
                                                ),
                                                errorWidget: (context, url, error) => new Container(
                                                  width: 110,
                                                  height: 110, 
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey[300],
                                                      borderRadius: BorderRadius.all(Radius.circular(5))
                                                  ),
                                                  child: Center(
                                                    child: Icon(
                                                        Icons.error
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            SizedBox(height: 5,),                                                                                        
                                              Container(                                                
                                                //text kepanjangan jadi titik-titik                                                                              
                                                margin: const EdgeInsets.only(bottom: 10.0,right: 5.0,left: 5.0),
                                                child: Text(
                                                  model.productCategory[index].categoryname,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold,
                                                      color: Hexcolor("#0d306b")),
                                                  maxLines: 2,
                                                  textAlign: TextAlign.justify,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
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
                                    },),
                          )
                        ],
                      ),
                    ),
                  ),
              )
        )
          
        ),
   );
  }
  
}
import 'package:flutter/material.dart';
import 'package:sufismart/ViewModel/base_viewmodel.dart';
import 'package:sufismart/enums/viewstate.dart';
import 'package:sufismart/locator.dart';
import 'package:sufismart/model/banner_model.dart';
import 'package:sufismart/model/imagenews_model.dart';
import 'package:sufismart/model/imagepromo_model.dart';
import 'package:sufismart/services/api.dart';


class HomeViewModel extends BaseViewModel{
  Api _api = locator<Api>();
  List<BannerModel> banner;
  List<ImgPromoModel> imgPromo;
  List<ImgNewsModel> imgNews;

  Future getAll(BuildContext context){
    getBanner(context);
    //getImgPromo(context);
    getImgNews(context);
  }

  Future getBanner(BuildContext context) async {
    setState(ViewState.Busy);
    banner = await _api.getBanner(context);
    notifyListeners();
    setState(ViewState.Idle);
  }

  // Future getImgPromo(BuildContext context) async {
  //   setState(ViewState.Busy);
  //   imgPromo = await _api.getImgPromoHome(context);
  //   notifyListeners();
  //   setState(ViewState.Idle);
  // }

   Future getImgNews(BuildContext context) async {
    setState(ViewState.Busy);
    imgNews = await _api.getImgNewsHome(context);
    notifyListeners();
    setState(ViewState.Idle);
  }
}


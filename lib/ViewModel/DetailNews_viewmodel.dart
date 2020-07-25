import 'package:flutter/material.dart';
import 'package:sufismart/enums/viewstate.dart';
import 'package:sufismart/locator.dart';
import 'package:sufismart/model/news_detail_model.dart';
import 'package:sufismart/services/api.dart';

import 'base_viewmodel.dart';

class NewsDetailViewModel extends BaseViewModel{
  Api _api = locator<Api>();
  DataDetailNews dataNews;

  Future getDetailDataNews(BuildContext context,String newsid) async{
    setState(ViewState.Busy);    
    dataNews = await _api.getDetailNews(context, newsid);
    notifyListeners();
    setState(ViewState.Idle);
  }
}
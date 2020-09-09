import 'package:flutter/cupertino.dart';
import 'package:sufismart/ViewModel/base_viewmodel.dart';
import 'package:sufismart/enums/viewstate.dart';
import 'package:sufismart/locator.dart';
import 'package:sufismart/model/news_detail_model.dart';
import 'package:sufismart/model/news_model.dart';
import 'package:sufismart/services/api.dart';

class NewsViewModel extends BaseViewModel{
  Api _api = locator<Api>();
  List<NewsModel> news;
  DataDetailNews dataDetailNews;
  
  // Future getAll(BuildContext context){    
  //   getDataNews(context);
  // }

  Future getDataNews(BuildContext context) async{
    setState(ViewState.Busy);
    news = await _api.getNews(context);
    notifyListeners();
    setState(ViewState.Idle);
  }

  Future getDetailDataNews(BuildContext context,String id) async{
    setState(ViewState.Busy);     
    dataDetailNews = await _api.getDetailNews(context,id);
    notifyListeners();
    setState(ViewState.Idle);
  }
}
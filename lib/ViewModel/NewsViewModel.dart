import 'package:flutter/cupertino.dart';
import 'package:sufismart/ViewModel/base_viewmodel.dart';
import 'package:sufismart/enums/viewstate.dart';
import 'package:sufismart/locator.dart';
import 'package:sufismart/model/news_model.dart';
import 'package:sufismart/services/api.dart';

class NewsViewModel extends BaseViewModel{
  Api _api = locator<Api>();
  List<NewsModel> news;
  Future getAll(BuildContext context){    
    getDataNews(context);
  }

  Future getDataNews(BuildContext context) async{
    setState(ViewState.Busy);
    news = await _api.getNews(context);
    notifyListeners();
    setState(ViewState.Idle);
  }
}
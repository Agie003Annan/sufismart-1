import 'package:flutter/material.dart';
import 'package:sufismart/ViewModel/base_viewmodel.dart';
import 'package:sufismart/enums/viewstate.dart';
import 'package:sufismart/locator.dart';
import 'package:sufismart/model/ModelAplikasi.dart';
import 'package:sufismart/services/api.dart';

class AboutViewModel extends BaseViewModel{
   Api _api = locator<Api>();
   DataAplikasi dataAplikasi;

   Future getInfoAplikasi(BuildContext context) async {
    setState(ViewState.Busy);    
    dataAplikasi = await _api.getAplikasi(context);
    notifyListeners();
    setState(ViewState.Idle);
  }

}
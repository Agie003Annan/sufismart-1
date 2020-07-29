import 'package:flutter/material.dart';
import 'package:sufismart/ViewModel/base_viewmodel.dart';
import 'package:sufismart/enums/viewstate.dart';
import 'package:sufismart/locator.dart';
import 'package:sufismart/model/promo_model.dart';
import 'package:sufismart/services/api.dart';

class PromoViewModel extends BaseViewModel{
  Api _api = locator<Api>();
  List<PromoModel> promo;
  
  // Future getAll(BuildContext context){    
  //   getDataPromo(context);
  // }

  Future getDataPromo(BuildContext context) async{
    setState(ViewState.Busy);
    promo = await _api.getPromo(context);
    notifyListeners();
    setState(ViewState.Idle);
  }
}
import 'package:flutter/cupertino.dart';
import 'package:sufismart/ViewModel/base_viewmodel.dart';
import 'package:sufismart/enums/viewstate.dart';
import 'package:sufismart/model/profile_model.dart';
import 'package:sufismart/services/api.dart';

import '../locator.dart';

class AccountViewModel extends BaseViewModel{
  Api _api = locator<Api>();
  DataProfile dataprofile;
  bool hidePass = true;
  bool hidePass2 = true;
  bool hidePass3 = true;

  void changeHidePass() {
    hidePass = !hidePass;
    notifyListeners();
  }

  void changeHidePass2() {
    hidePass2 = !hidePass2;
    notifyListeners();
  }

  void changeHidePass3() {
    hidePass3 = !hidePass3;
    notifyListeners();
  }

  Future getInfoCustomer(BuildContext context,String strEmailCust) async {
    setState(ViewState.Busy);     
    print("email : $strEmailCust");
    dataprofile = await _api.getDetailUser(context,strEmailCust);
    notifyListeners();
    setState(ViewState.Idle);
  }

  Future<bool> sendProfil(String strEmail,String strTgllahir,String strNoHp,String strNokon1,String strNokon2,String strNokon3,String strNoKtp,BuildContext context) async {
    setState(ViewState.Busy);
    var success = await _api.updateProfil(strEmail, strTgllahir, strNoHp, strNokon1, strNokon2,strNokon3,strNoKtp,context);
    setState(ViewState.Idle);
    return success;    
  }

  Future<bool> sendUpdatePassword(String stremail,String strpasslama,String strpassbaru, BuildContext context) async {
    setState(ViewState.Busy);
    var success = await _api.updatePassword(stremail,strpasslama,strpassbaru,context);
    setState(ViewState.Idle);
    return success;
  }
}
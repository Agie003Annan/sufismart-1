import 'package:flutter/material.dart';
import 'package:sufismart/ViewModel/base_viewmodel.dart';
import 'package:sufismart/enums/viewstate.dart';
import 'package:sufismart/locator.dart';
import 'package:sufismart/services/api.dart';

class LoginViewModel extends BaseViewModel{
  Api _api = locator<Api>();

  bool hidePass = true;

  void changeHidePass() {
    hidePass = !hidePass;
    notifyListeners();
  }

  Future<bool> checkLogin(String strEmail,String strPassword,String strPlayreid,BuildContext context) async {
    // if(strEmail == "" && strPassword == ""){
    //    Scaffold.of(context).showSnackBar(SnackBar(
    //     content: Text("Please complete this form"),
    //   ));
    //   setState(ViewState.Idle);
    //   return false;
    // }

    print('email masuk viewmodel -> '+strEmail);
    print('password masuk viewmodel -> '+strPassword);
     print('playerid masuk viewmodel -> '+strPlayreid);
    setState(ViewState.Busy);
    //final SharedPreferences prefs = await SharedPreferences.getInstance();    
    var success = await _api.login(strEmail, strPassword,strPlayreid, context);
    setState(ViewState.Idle);
    return success;
  }

}
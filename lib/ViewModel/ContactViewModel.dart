import 'package:flutter/cupertino.dart';
import 'package:sufismart/ViewModel/base_viewmodel.dart';
import 'package:sufismart/enums/viewstate.dart';
import 'package:sufismart/locator.dart';
import 'package:sufismart/services/api.dart';

class ContactViewModel extends BaseViewModel{
  Api _api = locator<Api>();


  Future<bool> sendKeluhan(String namalengkap,String email, String nohp,String pesan,BuildContext context) async{
    setState(ViewState.Busy);
    var success = await _api.insertKeluhan(namalengkap, email, nohp, pesan, context);
    setState(ViewState.Idle);
    return success;
  }

  Future<bool> sendForgotPassword(String strEmail,BuildContext context) async{
    setState(ViewState.Busy);
    var success = await _api.insertForgotPassword(strEmail, context);
    setState(ViewState.Idle);
    return success; 
  }
}
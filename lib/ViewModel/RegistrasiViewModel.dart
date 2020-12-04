import 'package:flutter/material.dart';
import 'package:sufismart/ViewModel/base_viewmodel.dart';
import 'package:sufismart/enums/viewstate.dart';
import 'package:sufismart/locator.dart';
import 'package:sufismart/services/api.dart';

class RegistrasiViewModel extends BaseViewModel{
  Api _api = locator<Api>();
  

  bool hidePass = true;

  void changeHidePass() {
    hidePass = !hidePass;
    notifyListeners();
  }

  Future<bool> sendRegistrasi(String strnamalengkap,String nohp,String tanggallahir,String email,String password,String pekerjaan,String gender,String playerid,BuildContext context) async{

    // if(strnamalengkap == "" ){
    //    Scaffold.of(context).showSnackBar(SnackBar(
    //     content: Text("Please complete this form"),
    //   ));
    //   setState(ViewState.Idle);
    //   return false;
    // }

    // print('nama masuk viewmodel -> '+namalengkap);
    // print('nama masuk viewmodel -> '+ nohp );
    // print('tanggal lahir masuk viewmodel -> '+tanggallahir);
    // print('email masuk viewmodel -> '+email);
    // print('password masuk viewmodel -> '+password);
    // print('pekerjaan masuk viewmodel -> '+pekerjaan);
    // print('gender masuk viewmodel -> '+gender);
    setState(ViewState.Busy);
    var success = await _api.insertRegistrasi(strnamalengkap, nohp, tanggallahir, email, password, pekerjaan, gender,playerid,context);
    setState(ViewState.Idle);
    return success;
  }
  
}
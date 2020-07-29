import 'package:flutter/cupertino.dart';
import 'package:sufismart/model/kotadetail_model.dart';

import '../enums/viewstate.dart';
import '../locator.dart';
import '../services/api.dart';
import 'base_viewmodel.dart';

class BranchViewModel extends BaseViewModel{
   Api _api = locator<Api>();
  List<KotaDetailModel> dataDetailBranch;
  
   Future getDataBranchdetail(BuildContext context,String kota) async {
    setState(ViewState.Busy);
    dataDetailBranch = await _api.getBranchDetail(context, kota);
    notifyListeners();
    setState(ViewState.Idle);
   }
}
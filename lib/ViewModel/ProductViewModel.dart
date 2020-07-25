import 'package:flutter/material.dart';
import 'package:sufismart/ViewModel/base_viewmodel.dart';
import 'package:sufismart/enums/viewstate.dart';
import 'package:sufismart/locator.dart';
import 'package:sufismart/model/product_model.dart';
import 'package:sufismart/model/productlist_model.dart';
import 'package:sufismart/model/producttype_model.dart';
import 'package:sufismart/services/api.dart';

class ProductViewModel extends BaseViewModel{
  Api _api = locator<Api>();
  List<ProductModel> productCategory;
  List<ProductListModel> productList;
  List<ProductTypeModel> productType;

  // Future getAll(BuildContext context){    
  //   getDataProduct(context);
  // }

  Future getDataProduct(BuildContext context) async{
    setState(ViewState.Busy);
    productCategory = await _api.getProduct(context);
    notifyListeners();
    setState(ViewState.Idle);
  }

  Future getDataProductList(BuildContext context,String category) async {
    setState(ViewState.Busy);
    productList = await _api.getProductList(context, category);
    notifyListeners();
    setState(ViewState.Idle);
  }

  Future getDataProductType(BuildContext context,String productCode) async{
    setState(ViewState.Busy);
    productType = await _api.getProductType(context, productCode);
    notifyListeners();
    setState(ViewState.Idle);
  }

}
import 'package:sufismart/ViewModel/AboutViewModel.dart';
import 'package:sufismart/ViewModel/ContactViewModel.dart';
import 'package:sufismart/ViewModel/DetailNews_viewmodel.dart';
import 'package:sufismart/ViewModel/HomeViewModel.dart';
import 'package:sufismart/ViewModel/LoginViewModel.dart';
import 'package:sufismart/ViewModel/NewsViewModel.dart';
import 'package:sufismart/ViewModel/ProductViewModel.dart';
import 'package:sufismart/ViewModel/PromoViewModel.dart';
import 'package:sufismart/ViewModel/RegistrasiViewModel.dart';
import 'package:sufismart/ViewModel/branchViewModel.dart';
import 'package:sufismart/services/api.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {  
  locator.registerLazySingleton(() => Api());  
  locator.registerFactory(() => HomeViewModel());
  locator.registerFactory(() => NewsViewModel());
  locator.registerFactory(() => NewsDetailViewModel());
  locator.registerFactory(() => PromoViewModel());
  locator.registerFactory(() => ProductViewModel());
  locator.registerFactory(() => LoginViewModel());
  locator.registerFactory(() => RegistrasiViewModel());
  locator.registerFactory(() => ContactViewModel());
  locator.registerFactory(() => BranchViewModel());
  locator.registerFactory(() => AboutViewModel());
  // locator.registerFactory(() => RegisterViewModel());
  // locator.registerFactory(() => ForgotPasswordViewModel());
  // locator.registerFactory(() => OtpViewModel());
  // locator.registerFactory(() => HomeViewModel());
  // locator.registerFactory(() => ProductViewModel());
  // locator.registerFactory(() => PromoViewModel());
  // locator.registerFactory(() => AccountViewModel());
  // locator.registerFactory(() => CartViewModel());
  // locator.registerFactory(() => HistoryTransactionViewModel());
  // locator.registerFactory(() => DetailHistoryTransactionViewModel());
  // locator.registerFactory(() => TrackingTransactionViewModel());
  // locator.registerFactory(() => ChangePasswordViewModel());
  // locator.registerFactory(() => AddressViewModel());
  // locator.registerFactory(() => AddAddressViewModel());
  // locator.registerFactory(() => DeliveryViewModel());
  // locator.registerFactory(() => PaymentMethodViewModel());
}
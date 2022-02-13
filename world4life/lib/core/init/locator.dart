import 'package:get_it/get_it.dart';
import 'package:world4life/core/constants/validator_constant.dart';
import 'package:world4life/core/init/api_data.dart';
import 'package:world4life/product/utility/userAuthentication/services/user_service.dart';
import 'package:world4life/view/homeLanding/subviews/add/service/add_service.dart';
import 'package:world4life/view/homeLanding/subviews/home/service/home_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  // TODO : Eksik singletonlar buraya eklenecek
  locator.registerLazySingleton<HomeService>(() => HomeService());
  locator.registerLazySingleton<AddService>(() => AddService());
  locator.registerLazySingleton<ApiData>(() => ApiData());
  locator.registerLazySingleton<Validator>(() => Validator());
  locator.registerLazySingleton<UserService>(() => UserService());
}

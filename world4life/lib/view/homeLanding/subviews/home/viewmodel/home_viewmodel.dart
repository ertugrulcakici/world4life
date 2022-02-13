import 'package:flutter/foundation.dart';
import 'package:world4life/core/init/locator.dart';
import 'package:world4life/view/homeLanding/subviews/home/model/news_model.dart';
import 'package:world4life/view/homeLanding/subviews/home/service/home_service.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeService _homeService = locator<HomeService>();
  HomeViewModel();
}

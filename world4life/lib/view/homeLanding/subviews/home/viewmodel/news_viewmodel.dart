import 'package:flutter/foundation.dart';
import 'package:world4life/core/init/locator.dart';
import 'package:world4life/view/homeLanding/subviews/home/model/news_model.dart';
import 'package:world4life/view/homeLanding/subviews/home/service/home_service.dart';

class NewsViewmodel extends ChangeNotifier {
  final HomeService _homeService = locator<HomeService>();
  final List<NewsModel> _newsList = [];
  List<NewsModel> get newsList => _newsList;

  NewsViewmodel() {
    _newsList.clear();
    getNews();
  }

  Future getNews() async {
    _newsList.addAll(await _homeService.getNews());
    notifyListeners();
  }
}

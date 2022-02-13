
import 'package:world4life/product/models/response_model.dart';
import 'package:world4life/product/models/waste_model.dart';
import 'package:world4life/view/features/services/network_services.dart';
import 'package:world4life/view/homeLanding/subviews/home/model/banner_board_model.dart';

import 'package:world4life/view/homeLanding/subviews/home/model/news_model.dart';

class HomeService extends RestApiHelper {
  HomeService() : super();

  Future<List<NewsModel>> getNews() async {
    ResponseModel response = await get("news");
    List<NewsModel> _list = [];

    for (Map<String, dynamic> item in response.data["news"]) {
      _list.add(NewsModel.fromJson(item));
    }

    return _list;
  }

  Future<List<BannerboardModel>> getBannerboards() async {
    ResponseModel response = await get("banners");
    List<BannerboardModel> _list = [];
    for (Map<String, dynamic> item in response.data["banners"]) {
      _list.add(BannerboardModel.fromJson(item));
    }
    return _list;
  }

  Future<List<WasteModel>> getClosest() async {
    ResponseModel response = await getpost();
    List<WasteModel> _list = [];
    for (Map<String, dynamic> item in response.data["posts"]) {
      _list.add(WasteModel.fromMap(item));
    }
    return _list;
  }
}

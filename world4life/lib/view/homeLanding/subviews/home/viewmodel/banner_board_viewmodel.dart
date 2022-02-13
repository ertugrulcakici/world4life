import 'package:flutter/foundation.dart';
import 'package:world4life/core/init/locator.dart';
import 'package:world4life/view/homeLanding/subviews/home/model/banner_board_model.dart';
import 'package:world4life/view/homeLanding/subviews/home/service/home_service.dart';

class BannerboardViewmodel extends ChangeNotifier {
  final HomeService _homeService = locator<HomeService>();
  final List<BannerboardModel> _boardList = [];
  List<BannerboardModel> get boardList => _boardList;

  BannerboardViewmodel() {
    _boardList.clear();
    getBoards();
  }

  Future getBoards() async {
    _boardList.addAll(await _homeService.getBannerboards());
    notifyListeners();
  }
}

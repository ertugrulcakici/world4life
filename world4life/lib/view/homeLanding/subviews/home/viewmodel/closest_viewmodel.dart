import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:world4life/core/init/locator.dart';
import 'package:world4life/product/models/waste_model.dart';
import 'package:world4life/view/homeLanding/subviews/home/service/home_service.dart';

class ClosestViewmodel extends ChangeNotifier {
  final HomeService _homeService = locator<HomeService>();
  final List<WasteModel> _closestList = [];

  List<WasteModel> get closestList => _closestList;

  ClosestViewmodel() {
    _closestList.clear();
    getClosest();
  }

  Future getClosest() async {
    var liste = await _homeService.getClosest();
    _closestList.addAll(liste);
    notifyListeners();
  }
}

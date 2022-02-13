import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:world4life/view/features/constant/home_constant.dart';
import 'package:world4life/view/homeLanding/build/model/custom_bottom_navigation_item.dart';

class HomeLandingViewmodel extends ChangeNotifier {
  List<CustomBottomNavigationItem> _bottomItems = [];
  List<CustomBottomNavigationItem> get bottomItems => _bottomItems;
  final PageController _controller = PageController();
  PageController get controller => _controller;

  HomeLandingViewmodel() {
    loadBottomItems();
  }
  loadBottomItems() {
    _bottomItems = HomeConstant.instance.items;
    notifyListeners();
  }

  void changePage(int index) {
    _controller.jumpToPage(
      index,
    );
  }

  getPages() => bottomItems.map((e) => e.child).toList();
}

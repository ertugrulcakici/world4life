import 'dart:developer';

import 'package:flutter/cupertino.dart';

class PageviewImageViewmodel extends ChangeNotifier {
  PageController _controller = PageController();
  PageController get controller => _controller;
   int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  changePage(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}

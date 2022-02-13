import 'package:flutter/material.dart';
import 'package:world4life/view/homeLanding/build/model/custom_bottom_navigation_item.dart';
import 'package:world4life/view/homeLanding/subviews/add/view/add_view.dart';
import 'package:world4life/view/homeLanding/subviews/home/view/home_view.dart';
import 'package:world4life/view/homeLanding/subviews/notification/view/notification_view.dart';
import 'package:world4life/view/homeLanding/subviews/profile/build/view/profile_view.dart';
import 'package:world4life/view/homeLanding/subviews/search/view/search_view.dart';

class HomeConstant {
  static HomeConstant instance = HomeConstant._init();
  HomeConstant._init();
  List<CustomBottomNavigationItem> items = [
    CustomBottomNavigationItem(
        0, "Anasayfa", HomeView(),Icons.home),
    CustomBottomNavigationItem(
        1, "Ara", SearchView(), Icons.search),
    CustomBottomNavigationItem(2, "Ekle", AddView(), Icons.add_box_outlined),
    CustomBottomNavigationItem(
        3, "Bildirim", NotificationView(), Icons.notifications),
    CustomBottomNavigationItem(4, "Profil", ProfileView(), Icons.person),
  ];
}

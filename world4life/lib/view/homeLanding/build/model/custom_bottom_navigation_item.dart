import 'package:flutter/cupertino.dart';

class CustomBottomNavigationItem {
  final int id;
  final String title;
  final IconData iconData;

  final Widget child;

  CustomBottomNavigationItem(this.id, this.title, this.child, this.iconData);
}

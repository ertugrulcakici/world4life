import 'package:flutter/material.dart';

class RouteModel {
  final String routeName;
  final Widget widget;
  get routeFunction => (BuildContext context) => widget;

  RouteModel(this.routeName, this.widget);

  Future<void> pushNamed(BuildContext context) async {
    await Navigator.pushNamed(context, routeName);
  }

  Future<void> pushAndRemoveUntil(BuildContext context) async {
    await Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => routeFunction),
        (Route<dynamic> route) => false);
  }

  Future<void> pushReplacementNamed(BuildContext context) async {
    await Navigator.pushReplacementNamed(context, routeName);
  }
}

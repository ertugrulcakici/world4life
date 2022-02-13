import "package:flutter/material.dart";
import 'package:world4life/core/constants/animation_constants.dart';

class SplashViewmodel extends ChangeNotifier {
  BuildContext context;
  String newRouteName;
  SplashViewmodel({required this.context, required this.newRouteName}) {
    _finish();
  }

  void _finish() async {
    Future.delayed(
        Duration(seconds: AnimationConstants.instance.SPLASH_DURATION), () {
      Navigator.pushNamedAndRemoveUntil(
          context, newRouteName, (route) => false);
    });
  }
}

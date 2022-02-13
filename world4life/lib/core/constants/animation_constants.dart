import 'package:flutter/material.dart';

class AnimationConstants {
  static AnimationConstants instance = AnimationConstants._init();
  AnimationConstants._init();
  final int SPLASH_DURATION = 2;
  final int PAGEVIEW_DURATION = 1;
  final Curve PAGEVIEW_CURVE = Curves.easeInOut;
}
// AnimationConstants.instance.SPLASH_DURATION
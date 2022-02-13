import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class AllRadius extends BorderRadius {
  AllRadius.image() : super.all(Radius.circular(5.sp));
  AllRadius.card() : super.all(Radius.circular(5.sp));
  AllRadius.bottomNav()
      : super.only(
          topLeft: const Radius.circular(12),
          topRight: const Radius.circular(12),
        );
}

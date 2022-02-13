import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class PagePadding extends EdgeInsets {
  PagePadding.all() : super.symmetric(horizontal: 5.w, vertical: 5.h);
  PagePadding.rowListview() : super.only(left: 3.w, top: 2.h);
}

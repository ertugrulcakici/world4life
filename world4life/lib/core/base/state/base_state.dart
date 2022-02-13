import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  boyutX(double oran) => MediaQuery.of(context).size.width * oran;
  boyutY(double oran) => MediaQuery.of(context).size.height * oran;
  ThemeData get themeData => Theme.of(context);
  Widget space(double space) => SizedBox(height: space.h);
  Widget spaceW(double space) => SizedBox(width: space.w);
  Widget errorText(String text) => Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      );
}

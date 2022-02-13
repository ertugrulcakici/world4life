import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:world4life/core/constants/color_constant.dart';

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: ColorConstant.instance.bac,
  hoverColor: ColorConstant.instance.bluemine,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.black),
      snackBarTheme: SnackBarThemeData(backgroundColor: ColorConstant.instance.mountainMiedov),
  unselectedWidgetColor: Colors.black.withOpacity(0.6),
  selectedRowColor: Colors.black,
  textTheme: TextTheme(
      subtitle1: TextStyle(
          fontSize: 16.sp, color: Colors.black, fontWeight: FontWeight.w700),
      headline3: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w800, fontSize: 25.sp),
      caption: TextStyle(
        fontSize: 8.sp,
        color: ColorConstant.instance.bluemine,
      )),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.black),
    ),
  ),
);

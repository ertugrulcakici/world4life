import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:world4life/core/constants/assets_constants.dart';
import 'package:world4life/view/authenticate/splash/viewmodel/splash_viewmodel.dart';

class SplashScreen extends StatelessWidget {
  final String routeName;
  const SplashScreen({Key? key, required this.routeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      lazy: false,
      create: (context) =>
          SplashViewmodel(context: context, newRouteName: routeName),
      child: Scaffold(
        body: SizedBox(
          height: 100.h,
          child: Image.asset(
            AssetConstant.instance.SPLASH_SCREEN,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}

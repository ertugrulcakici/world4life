import 'package:flutter/material.dart';
import 'package:world4life/view/authenticate/login/view/login_view.dart';
import 'package:world4life/view/authenticate/register/view/register_view.dart';
import 'package:world4life/view/authenticate/splash/view/splash_screen.dart';
import 'package:world4life/view/homeLanding/build/view/home_landing_view.dart';
import 'package:world4life/product/models/route_model.dart';

class Routes {
  Routes._init();
  static Routes instance = Routes._init();
  static final Map<String, WidgetBuilder> routes = {
    splash.routeName: splash.routeFunction,
    home.routeName: home.routeFunction,
    register.routeName : register.routeFunction,
    login.routeName : login.routeFunction
  };

  static final RouteModel splash =
      RouteModel("/", SplashScreen(routeName: home.routeName));
  static final RouteModel home = RouteModel("/home", const HomeLandingView());
  static final RouteModel register = RouteModel("/register", const RegisterView());
  static final RouteModel login = RouteModel("/login", const LoginView());
}

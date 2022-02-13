import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world4life/core/management/dialog/dialog_management.dart';
import 'package:world4life/product/models/response_model.dart';
import 'package:world4life/view/authenticate/login/model/user_login_model.dart';
import 'package:world4life/view/authenticate/login/service/login_service.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoginViewmodel extends ChangeNotifier {
  late final GlobalKey<FormState> _formKey;
  GlobalKey<FormState> get formKey => _formKey;
  final UserLoginModel _user = UserLoginModel();

  BuildContext? context;
  LoginViewmodel({this.context}) {
    _formKey = GlobalKey<FormState>();
  }

  setUsername(text) => _user.username = text;
  setPassword(text) => _user.password = text;

  login() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      context?.loaderOverlay.show();
      ResponseModel _response = await LoginService().login(_user);
      context?.loaderOverlay.hide();
      if (_response.isSuccess && context != null) {
        Navigator.pop(context!);
      } else {
        if (context != null) {
          await DialogManagement().showFlushBar(context!,
              title: "Hata", message: _response.errorMessage ?? "");
        }
      }
    }
  }
}

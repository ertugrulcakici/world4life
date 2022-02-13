import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world4life/core/management/dialog/dialog_management.dart';
import 'package:world4life/product/models/response_model.dart';
import 'package:world4life/product/models/user_model.dart';
import 'package:world4life/view/authenticate/register/model/user_register_model.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:world4life/view/authenticate/register/service/register_service.dart';

class RegisterViewmodel extends ChangeNotifier {
  late final GlobalKey<FormState> _formKey;
  GlobalKey<FormState> get formKey => _formKey;
  final UserRegisterModel _user = UserRegisterModel();

  BuildContext? context;
  RegisterViewmodel({this.context}) {
    _formKey = GlobalKey<FormState>();
  }

  setEmail(text) => _user.email = text;
  setUsername(text) => _user.username = text;
  setPassword(text) => _user.password = text;

  register() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      context?.loaderOverlay.show();
      ResponseModel _response = await RegisterService().register(_user);
      context?.loaderOverlay.hide();
      if (_response.isSuccess) {
        User _user = User.fromJson(_response.data);
      } else {
        if (context != null) {
          await DialogManagement().showFlushBar(context!,
              title: "Hata", message: _response.errorMessage ?? "");
        }
      }
    } else {}
  }
}

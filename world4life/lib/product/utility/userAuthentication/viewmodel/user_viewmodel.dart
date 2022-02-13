import 'package:flutter/cupertino.dart';
import 'package:world4life/core/init/locator.dart';
import 'package:world4life/product/models/response_model.dart';
import 'package:world4life/product/models/user_model.dart';
import 'package:world4life/product/utility/userAuthentication/services/user_service.dart';

class UserViewmodel extends ChangeNotifier {
  final UserService _userService = locator<UserService>();
  User? _user;
  User? get user => _user;
  UserViewmodel() {
    currentUser();
  }
  currentUser() async {
    ResponseModel _responseModel = await _userService.currentUser();
    if (_responseModel.isSuccess) {
      _user = User.fromJson(_responseModel.data);
      notifyListeners();
    }
  }
}

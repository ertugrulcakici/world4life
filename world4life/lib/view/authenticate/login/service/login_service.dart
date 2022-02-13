import 'package:shared_preferences/shared_preferences.dart';
import 'package:world4life/core/base/network/restapi_helper.dart';
import 'package:world4life/product/models/response_model.dart';
import 'package:world4life/view/authenticate/login/model/user_login_model.dart';

class LoginService with RestApiBase {
  Future<ResponseModel> login(UserLoginModel userLoginModel) async {
    ResponseModel response =
        await post(endpoint: "/login", formdata: userLoginModel.toJson());
    if (response.isSuccess) {
      SharedPreferences _pref = await SharedPreferences.getInstance();
      await _pref.setString("token", response.data["token"]);
    }
    return response;
  }
}

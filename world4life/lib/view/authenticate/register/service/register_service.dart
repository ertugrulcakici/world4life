import 'package:shared_preferences/shared_preferences.dart';
import 'package:world4life/core/base/network/restapi_helper.dart';
import 'package:world4life/product/models/response_model.dart';
import 'package:world4life/view/authenticate/register/model/user_register_model.dart';

class RegisterService with RestApiBase {
  Future<ResponseModel> register(UserRegisterModel userRegisterModel) async {
    ResponseModel response =
        await post(endpoint: "/register", formdata: userRegisterModel.toJson());
    if (response.isSuccess) {
      SharedPreferences _pref = await SharedPreferences.getInstance();
      await _pref.setString("token", response.data["token"]);
    }
    return response;
  }
}

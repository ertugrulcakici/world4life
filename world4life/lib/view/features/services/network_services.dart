import 'dart:developer';

import 'package:world4life/core/base/network/restapi_helper.dart';
import 'package:world4life/product/models/response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RestApiHelper extends RestApiBase {
  Future<ResponseModel> getpost(
          {String area = "*", String subarea = "*", int category = 0}) async =>
      await get("getpost/" + [area, subarea, category].join("/"));

  Future<ResponseModel> currentUser() async {
    log("fasd");
    SharedPreferences _sharedInstance = await SharedPreferences.getInstance();
    String? token = _sharedInstance.getString("token");
    if (token != null) {
      return await get("user/" + token);
    } else {
      return ResponseModel.withError("No token");
    }
  }
}

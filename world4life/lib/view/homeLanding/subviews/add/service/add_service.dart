import 'package:world4life/core/base/network/restapi_helper.dart';
import 'package:world4life/core/init/api_data.dart';
import 'package:world4life/core/init/locator.dart';
import 'package:world4life/product/models/response_model.dart';
import 'package:world4life/product/models/waste_model.dart';
import 'package:world4life/view/features/services/network_services.dart';

class AddService extends RestApiHelper {
  AddService() : super();

  Future<void> add() async {}

  Future<ResponseModel> addpost(WasteModel wasteModel) async => await post(
      endpoint: locator<ApiData>().getImageUrl + "addpost",
      formdata: wasteModel.toMap(),
      img_path: wasteModel.img_name);
}

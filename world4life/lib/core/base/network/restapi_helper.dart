

import 'package:dio/dio.dart';
import "package:world4life/core/init/api_data.dart";
import 'package:world4life/core/init/locator.dart';
import 'package:world4life/product/enums/connection_type.dart';
import 'package:world4life/product/models/response_model.dart';
import 'package:world4life/product/models/waste_model.dart';

class RestApiHelperModel {
  final String endpoint;
  final ConnectionType connectionType;
  final dynamic data;

  RestApiHelperModel(
      {required this.endpoint, required this.connectionType, this.data});

  get url => locator<ApiData>().getImageUrl + endpoint;
}

abstract class RestApiBase {
  // rest api base sınıfı, sadece bağlantı için temel post, get gibi methodları barındırıyor. Rest api helper sınıfı, bu sınıftan miras alıp, birden fazla sayfada kullanılacak servis methodlarını barındırıyor
  // Future<ResponseModel> login({required String username,required String password})

  final Dio dio = Dio();

  Future<ResponseModel> post(
      {required String endpoint,
      required Map<String, dynamic> formdata,
      String? img_path}) async {
    late ResponseModel _responseModel;
    FormData _data = FormData.fromMap(formdata);
    if (img_path != null) {
      _data.files.add(MapEntry("file", await MultipartFile.fromFile(img_path)));
    }

    try {
      final Response _response =
          await dio.post(locator<ApiData>().url + endpoint, data: _data);
      _responseModel = ResponseModel(
          data: _response.data, statusCode: _response.statusCode!);
    } on DioError catch (e) {
      _responseModel = ResponseModel.withDioError(e);
      _responseModel.errorMessage = e.message;
    }
    return _responseModel;
  }

  Future<ResponseModel> get(String endpoint) async {
    late ResponseModel _responseModel;
    try {
      final Response response =
          await dio.get(locator<ApiData>().url + endpoint);
      _responseModel =
          ResponseModel(data: response.data, statusCode: response.statusCode!);
    } on DioError catch (e) {
      _responseModel = ResponseModel.withDioError(e);
    }
    return _responseModel;
  }
  // get

}

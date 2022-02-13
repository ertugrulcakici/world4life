import 'package:dio/dio.dart';

class ResponseModel {
  late Map<String, dynamic> data;
  late bool isSuccess;
  String? errorMessage;
  String? errorType;
  int? statusCode;

  ResponseModel({required this.data, required this.statusCode}) {
    if (statusCode == 200) {
      isSuccess = true;
    }else {
      isSuccess = false;
      errorMessage = data['message'];
      errorType = data['type'];
    }
  }

  ResponseModel.withDioError(DioError e) {
    data = {};
    isSuccess = false;
    errorMessage = e.message;
    errorType = e.type.toString();
    statusCode = e.response?.statusCode ?? 0;
  }

  ResponseModel.withError(e) {
    data = {};
    isSuccess = false;
    errorMessage = e.toString();
    errorType = e.runtimeType.toString();
    statusCode = 0;
  }

  @override
  String toString() =>
      "ResponseModel(data: $data, isSuccess: $isSuccess, errorMessage: $errorMessage , statusCode: $statusCode, errorType: $errorType)";
}

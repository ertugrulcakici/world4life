
import 'package:world4life/core/init/api_data.dart';
import 'package:world4life/core/init/locator.dart';

class BannerboardModel {
  late int id;
  late String _img_name;
  late String url;

  String get imageUrl => locator<ApiData>().getImageUrl + _img_name;

  BannerboardModel.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    _img_name = json['img_name'];
    url = json['url'];
  }
}

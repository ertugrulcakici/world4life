
import 'package:world4life/core/init/api_data.dart';
import 'package:world4life/core/init/locator.dart';

class NewsModel {
  late int id;
  late String title;
  late String description;
  late String _imgName;
  late DateTime createdDate;
  late String content;

  String get imageUrl => locator<ApiData>().getImageUrl + _imgName;

  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    title = json['title'];
    description = json['description'];
    _imgName = json['img_name'];
    createdDate = DateTime.fromMillisecondsSinceEpoch(json['created_date']);
    content = json['content'];
  }
}

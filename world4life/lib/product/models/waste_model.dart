// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:world4life/core/init/api_data.dart';
import "package:animated_card/animated_card.dart";
import 'package:world4life/core/init/locator.dart';
import 'package:world4life/product/enums/image_types.dart';
import 'package:world4life/product/widget/image/custom_image.dart';

class WasteModel {
  late int ID;
  late String title;
  late double lang;
  late double long;
  late String description;
  late String img_name;
  late int isPicked;
  late int created_date;
  late int created_by;
  late String area;
  late String subarea;
  late String category_description;
  late String category_img_name;
  late int category_id;
  late String username;

  Map<String, dynamic> toMap() {
    return {
      'ID': ID,
      'title': title,
      'lang': lang,
      'long': long,
      'description': description,
      'img_name': img_name,
      'isPicked': isPicked,
      'created_date': created_date,
      'created_by': created_by,
      'area': area,
      'subarea': subarea,
      'category_description': category_description,
      'category_img_name': category_img_name,
      'category_id': category_id,
      "username": username,
    };
  }

  WasteModel.fromMap(Map<String, dynamic> map) {
    ID = map['ID']?.toInt() ?? 0;
    title = map['title'] ?? '';
    lang = map['lang']?.toDouble() ?? 0.0;
    long = map['long']?.toDouble() ?? 0.0;
    description = map['description'] ?? '';
    img_name = map['img_name'] ?? '';
    isPicked = map['isPicked']?.toInt() ?? 0;
    created_date = map['created_date']?.toInt() ?? 0;
    created_by = map['created_by'] ?? 0;
    area = map['area'] ?? '';
    subarea = map['subarea'] ?? '';
    category_description = map['category_description'] ?? '';
    category_img_name = map['category_img_name'] ?? '';
    category_id = map['category_id'] ?? '';
    username = map['username'] ?? '';
  }

  AnimatedCard toWidget(BuildContext context) => AnimatedCard(
        child: Card(
          child: ListTile(
            leading: CustomImage.show(
                  ImageType.Network, locator<ApiData>().getImageUrl + category_img_name ,width: 14.w),
            title: Text(title),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            subtitle: Text(description),
            onTap: () {},
          ),
        ),
      );
}

import 'package:world4life/product/models/waste_model.dart';
import 'package:world4life/view/homeLanding/subviews/home/model/banner_board_model.dart';
import 'package:world4life/view/homeLanding/subviews/home/model/news_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TestDataConstants {
  // static final List<NewsModel> newsModels = [
  //   NewsModel(
  //       id: 1,
  //       title: "1",
  //       description: "1",
  //       imgName: "haber_1.png",
  //       createdDate: DateTime.now(),
  //       content: "Geçici content 1"),
  //   NewsModel(
  //       id: 2,
  //       title: "2",
  //       description: "2",
  //       imgName: "haber_2.png",
  //       createdDate: DateTime.now(),
  //       content: "Geçici content 2"),
  //   NewsModel(
  //       id: 3,
  //       title: "3",
  //       description: "3",
  //       imgName: "haber_3.png",
  //       createdDate: DateTime.now(),
  //       content: "Geçici content 3"),
  //   NewsModel(
  //       id: 4,
  //       title: "4",
  //       description: "4",
  //       imgName: "haber_4.png",
  //       createdDate: DateTime.now(),
  //       content: "Geçici content 4"),
  //   NewsModel(
  //       id: 5,
  //       title: "5",
  //       description: "5",
  //       imgName: "haber_5.png",
  //       createdDate: DateTime.now(),
  //       content: "Geçici content 5"),
  // ];

  // static final List<BannerboardModel> bannerboards = [
  //   BannerboardModel(
  //       id: 1,
  //       imgUrl:
  //           "https://cdn1.epicgames.com/aeac94c7a11048758064b82f8f8d20ed/offer/EA_Landscape-image_2560x1440-2560x1440-3455b2c51f7d0ac8837d0ea4ddfe8ba3.jpg",
  //       url: ""),
  //   BannerboardModel(
  //       id: 2,
  //       imgUrl:
  //           "https://i0.wp.com/shiftdelete.net/wp-content/uploads/2021/10/god-of-war-pc-surumunden-yeni-bilgiler-ortaya-cikti.jpg?fit=1280%2C720&ssl=1",
  //       url: ""),
  //   BannerboardModel(id: 3, imgUrl: "", url: ""),
  //   BannerboardModel(id: 4, imgUrl: "", url: ""),
  // ];

  static final List<WasteModel> coordinates = [
    WasteModel.fromMap({
      'ID': 1,
      'title': "title",
      'lang': 39.7099389,
      'long': 29.6722916,
      'description': "description",
      'img_name': "img_name",
      'isPicked': 1,
           'created_date': 1,
      'created_by': 1,
      'area': "area",
      'subarea': "subarea",
      'category_description': "category_description",
      'category_img_name': "category_img_name",
      'category_id':1,
      "username": "username",
    }),
    WasteModel.fromMap({
      'ID': 2,
      'title': "title",
      'lang': 39.6964556,
      'long': 29.8650728,
      'description': "description",
      'img_name': "img_name",
      'isPicked': 1,
      'created_date': 1,
      'created_by': 1,
      'area': "area",
      'subarea': "subarea",
      'category_description': "category_description",
      'category_img_name': "category_img_name",
      'category_id': 2,
      "username": "username",
    }),
    WasteModel.fromMap({
      'ID': 3,
      'title': "title",
      'lang': 40.4493375,
      'long': 30.5394734,
      'description': "description",
      'img_name': "img_name",
      'isPicked':1,
      'created_date': 1,
      'created_by': 1,
      'area': "area",
      'subarea': "subarea",
      'category_description': "category_description",
      'category_img_name': "category_img_name",
      'category_id':3,
      "username": "username",
    }),
    WasteModel.fromMap({
      'ID': 4,
      'title': "title",
      'lang': 40.8240349,
      'long': 30.702877,
      'description': "description",
      'img_name': "img_name",
      'isPicked': 1,
      'created_date': 1,
      'created_by': 1,
      'area': "area",
      'subarea': "subarea",
      'category_description': "category_description",
      'category_img_name': "category_img_name",
      'category_id': 4,
      "username": "username",
    }),
       WasteModel.fromMap({
      'ID': 5,
      'title': "title",
      'lang': 41.0338039,
      'long': 29.6478675,
      'description': "description",
      'img_name': "img_name",
      'isPicked':1,
      'created_date': 1,
      'created_by': 1,
      'area': "area",
      'subarea': "subarea",
      'category_description': "category_description",
      'category_img_name': "category_img_name",
      'category_id': 5,
      "username": "username",
    }
    )
  ];
  // static final List<BannerboardModel> bannerboards = [
  //   BannerboardModel(
  //       id: 1,
  //       imgUrl:
  //           "https://cdn1.epicgames.com/aeac94c7a11048758064b82f8f8d20ed/offer/EA_Landscape-image_2560x1440-2560x1440-3455b2c51f7d0ac8837d0ea4ddfe8ba3.jpg",
  //       url: ""),
  //   BannerboardModel(
  //       id: 2,
  //       imgUrl:
  //           "https://i0.wp.com/shiftdelete.net/wp-content/uploads/2021/10/god-of-war-pc-surumunden-yeni-bilgiler-ortaya-cikti.jpg?fit=1280%2C720&ssl=1",
  //       url: ""),
  // ];
}

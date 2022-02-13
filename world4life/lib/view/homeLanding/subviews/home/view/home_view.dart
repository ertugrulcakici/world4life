import 'dart:developer';

import "package:flutter/material.dart";
import 'package:world4life/core/base/state/base_state.dart';
import 'package:world4life/core/base/view/base_view.dart';
import 'package:world4life/core/management/padding/page_padding.dart';
import 'package:world4life/product/models/waste_model.dart';
import 'package:world4life/product/widget/imagePageview/view/pageview_image.dart';
import 'package:provider/provider.dart';
import 'package:world4life/view/homeLanding/subviews/home/viewmodel/banner_board_viewmodel.dart';
import 'package:world4life/view/homeLanding/subviews/home/viewmodel/closest_viewmodel.dart';
import 'package:world4life/view/homeLanding/subviews/home/viewmodel/news_viewmodel.dart';
part 'home_view_parts.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BaseView(onPageBuilder: (context) => _scaffold);
  }

  Scaffold get _scaffold => Scaffold(
        body: ListView(
          padding: PagePadding.all(),
          children: [_sponsporBoard, space(5), _news, space(5), _closesWaste],
        ),
      );
  Widget get _sponsporBoard => ChangeNotifierProvider(
        create: (context) => BannerboardViewmodel(),
        builder: (_, a) => PageViewImage(
          title: "Sponsorlar",
          images: _
              .watch<BannerboardViewmodel>()
              .boardList
              .map((e) => e.imageUrl)
              .toList(),
        ),
      );
  Widget get _news => ChangeNotifierProvider(
        create: (context) => NewsViewmodel(),
        builder: (_, a) => PageViewImage(
            title: "Haberler",
            images: _
                .watch<NewsViewmodel>()
                .newsList
                .map((e) => e.imageUrl)
                .toList()),
      );
  Widget get _closesWaste => ChangeNotifierProvider(
      create: (context) => ClosestViewmodel(),
      builder: (_, a) => ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _.watch<ClosestViewmodel>().closestList.length > 10
              ? 10
              : _.watch<ClosestViewmodel>().closestList.length,
          itemBuilder: (context, index) {
            WasteModel _model = _.watch<ClosestViewmodel>().closestList[index];
            return _model.toWidget(context);
          }));
}

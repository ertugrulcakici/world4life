part of 'home_view.dart';

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
        },
      ),
    );

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:world4life/core/init/theme/theme_management.dart';
import 'package:world4life/core/management/padding/page_padding.dart';
import 'package:world4life/product/enums/image_types.dart';
import 'package:world4life/product/widget/image/custom_image.dart';
import 'package:world4life/product/widget/imagePageview/viewmodel/pageview_image_viewmodel.dart';

class PageViewImage extends StatelessWidget {
  final List<String> images;
  final String title;
  const PageViewImage({Key? key, required this.images, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => PageviewImageViewmodel(),
        builder: (_, a) => _body(_));
  }

  Widget _body(BuildContext _) => Container(
        height: 25.h,
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                    padding: EdgeInsets.all(2.h),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(title, style: themeData.textTheme.subtitle1),
                          Text(
                            "Tümünü göster",
                            style: themeData.textTheme.caption,
                          )
                        ]))),
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [_images(_), _circles(_)],
              ),
            ),
          ],
        ),
      );

  Widget _images(BuildContext _) => SizedBox(
        height: 20.h,
        child: PageView(
          controller: _.watch<PageviewImageViewmodel>().controller,
          children: images.map((e) => _createImage(e)).toList(),
          onPageChanged: (value) =>
              _.read<PageviewImageViewmodel>().changePage(value),
        ),
      );
  Widget _circles(BuildContext _) => Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _getCircleChildren(_),
        ),
      );
  List<Widget> _getCircleChildren(BuildContext _) {
    List<Widget> _circles = [];
    for (int i = 0; i < images.length; i++) {
      _circles.add(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.w),
          child: ClipOval(
            child: Container(
                margin: EdgeInsets.only(bottom: 2.h),
                width: 2.w,
                height: 2.w,
                color: _.read<PageviewImageViewmodel>().currentIndex == i
                    ? Theme.of(_).selectedRowColor
                    : Theme.of(_).unselectedWidgetColor),
          ),
        ),
      );
    }
    return _circles;
  }

  Widget _createImage(String imageUrl) {
    return CustomImage.show(ImageType.Network, imageUrl);
  }
}

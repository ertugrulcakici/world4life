import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:world4life/core/base/view/base_view.dart';
import 'package:world4life/core/constants/assets_constants.dart';
import 'package:world4life/core/constants/routers.dart';
import 'package:world4life/core/management/padding/page_padding.dart';

class HaveNotUserView extends StatelessWidget {
  const HaveNotUserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseView(onPageBuilder: (context) => _scaffold(context));
  }

  Scaffold _scaffold(BuildContext context) => Scaffold(
        body: ListView(
          padding: PagePadding.all(),
          children: [
            SizedBox(
              height: 10.h,
            ),
            SvgPicture.asset(
              AssetConstant.instance.APP_LOGO,
              width: 50.w,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Hesabınız olmadan bu sayfaya giremezsiniz. Hemen aramıza katılın!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 5.h,
            ),
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, Routes.register.routeName),
              child: Text("Kayıt ol"),
            )
          ],
        ),
      );
}

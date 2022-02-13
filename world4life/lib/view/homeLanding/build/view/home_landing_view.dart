import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:world4life/view/homeLanding/build/view/custom_bottom_navigation_bar.dart';
import 'package:world4life/view/homeLanding/build/viewmodel/home_landing_viewmodel.dart';

class HomeLandingView extends StatelessWidget {
  const HomeLandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeLandingViewmodel(),
      builder: (_, a) => Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _.watch<HomeLandingViewmodel>().controller,
                children: _
                    .read<HomeLandingViewmodel>()
                    .bottomItems
                    .map((e) => e.child)
                    .toList(),
              ),
            ),
            Container(
              color: Colors.black,
              height: 8.h,
              child: CustomBottomNavigationBar(
                items: _.read<HomeLandingViewmodel>().bottomItems,
                onChange: (a) {
                  _.read<HomeLandingViewmodel>().changePage(a);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

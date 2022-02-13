import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:sizer/sizer.dart';
import 'package:world4life/core/management/radius/all_radius.dart';
import 'package:world4life/view/homeLanding/build/model/custom_bottom_navigation_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final List<CustomBottomNavigationItem> items;
  final Function(int) onChange;
  final double? height;
  const CustomBottomNavigationBar(
      {Key? key, required this.items, required this.onChange, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      onItemSelected: (i) {
        onChange(i);
      },
      // controller: _controller,
      screens: _buildScreens(),
      items: _navbarItems(),
      confineInSafeArea: true,
      backgroundColor:
          Theme.of(context).bottomNavigationBarTheme.backgroundColor ??
              Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: AllRadius.bottomNav(),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style7, // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() => items.map((e) => e.child).toList();
  List<PersistentBottomNavBarItem>? _navbarItems() => items
      .map(
        (e) => PersistentBottomNavBarItem(
          icon: Icon(
            e.iconData,
            size: 20.sp,
          ),
          activeColorSecondary: Colors.white,
          activeColorPrimary:
              _getColor(items.indexWhere((element) => element.id == e.id)),
          title: e.title,
        ),
      )
      .toList();

  Color _getColor(int index) {
    switch (index) {
      case 0:
        return Colors.purple;
      case 1:
        return Colors.blue;
      case 2:
        return Colors.red;
      case 3:
        return Colors.green;
      case 4:
        return Colors.brown;
      default:
        return Colors.blue;
    }
  }
}

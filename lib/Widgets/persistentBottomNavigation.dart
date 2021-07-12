import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:terapia_app/Screens/MainPages/contributionPage.dart';
import 'package:terapia_app/Screens/MainPages/mainScreen.dart';
import 'package:terapia_app/Screens/MainPages/menuScreen.dart';
import 'package:terapia_app/Screens/MainPages/requestPage.dart';

class BottomNavigation extends StatelessWidget {
  PersistentTabController _controller = PersistentTabController(initialIndex: 0);
  List<Widget> _buildScreens() {
    return [
      MainScreen(),
      ContributionPage(),
      RequestPage(),
      MenuScreen()
    ];
  }
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: Color(0xff56aee7),
        inactiveColorPrimary: Color(0xff6a77d0),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.money_dollar_circle_fill),
        title: ("Contributions"),
        activeColorPrimary: Color(0xff56aee7),
        inactiveColorPrimary: Color(0xff6a77d0),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.cart_fill),
        title: ("Requests"),
        activeColorPrimary: Color(0xff56aee7),
        inactiveColorPrimary: Color(0xff6a77d0),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.menu),
        title: ("More"),
        activeColorPrimary: Color(0xff56aee7),
        inactiveColorPrimary: Color(0xff6a77d0),
      )
    ];
  }


  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.fastOutSlowIn,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }
}

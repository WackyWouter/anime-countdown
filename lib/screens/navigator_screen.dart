import 'package:animecountdown/screens/account_screen.dart';
import 'package:animecountdown/screens/favourites_screen.dart';
import 'package:animecountdown/screens/settings_screen.dart';
import 'package:animecountdown/screens/trending_anime_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animecountdown/constant.dart';
import 'package:animecountdown/models/color_theme_wizard.dart';
import 'package:animecountdown/widgets/custom_nav_bar_widget.dart';
import 'package:animecountdown/models/custom_nav_bar_item.dart';
import 'package:provider/provider.dart';

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

// TODO https://stackoverflow.com/questions/55716230/how-to-do-nested-navigation-in-flutter

class NavigatorScreen extends StatefulWidget {
  static const String id = 'navigator_screen';
  @override
  _NavigatorScreenState createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  PersistentTabController _controller;
  bool _hideNavbar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavbar = false;
  }

  List<Widget> _buildScreen() {
    return [
      TrendingAnimeScreen(),
      FavouritesScreen(),
      AccountScreen(),
      SettingsScreen(),
    ];
  }

  List<CustomNavBarItem> _navBarsItems() {
    return [
      CustomNavBarItem(
        iconData: FontAwesomeIcons.fire,
      ),
      CustomNavBarItem(iconData: FontAwesomeIcons.solidHeart),
      CustomNavBarItem(iconData: FontAwesomeIcons.solidUserCircle),
      CustomNavBarItem(
        iconData: FontAwesomeIcons.cog,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorThemeWizard>(builder: (context, themeWizard, child) {
      return PersistentTabView(
        controller: _controller,
        itemCount: _navBarsItems().length,
        screens: _buildScreen(),
        confineInSafeArea: true,
        handleAndroidBackButtonPress: true,
//      resizeToAvoidBottomInset: true,
//      stateManagement: true,
//      hideNavigationBarWhenKeyboardShows: true,
//      popActionScreens: PopActionScreensType.all;
//      itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
//        duration: Duration(milliseconds: 200),
//        curve: Curves.ease,
//      ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 300),
        ),
        customWidget: CustomNavBarWidget(
          items: _navBarsItems(),
          iconSize: 50.0,
          inactiveColor: themeWizard.getIconColor(),
          activeColor: themeWizard.getPrimaryColor(),
          backgroundColor: kNavbarBackground,
          navBarHeight: 80.0,
          popScreensOnTapOfSelectedTab: true,
          selectedIndex: _controller.index,
          onItemSelected: (index) {
            setState(() {
              _controller.index = index;
            });
          },
        ),
        navBarStyle:
            NavBarStyle.custom, // Choose the nav bar style with this property.
      );
    });
  }
}

//https://pub.dev/packages/persistent_bottom_nav_bar/install
//https://github.com/BilalShahid13/PersistentBottomNavBar

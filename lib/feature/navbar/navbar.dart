import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:umc_mobile/constant/image_assets.dart';
import 'package:umc_mobile/feature/bag/bag.dart';
import 'package:umc_mobile/feature/chat/chat.dart';
import 'package:umc_mobile/feature/home/home.dart';
import 'package:umc_mobile/feature/profile/profile.dart';
import '../../constant/color.dart';

class Navbar extends StatelessWidget {
  const Navbar({
    super.key,
    required this.username,
  });

  final String username;

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;

    controller = PersistentTabController(initialIndex: 0);

    return PersistentTabView(
      context,
      navBarHeight: 68,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      // confineInSafeArea: true,
      backgroundColor: AppColors.biruNavbar, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true,
      //     true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        colorBehindNavBar: AppColors.abu,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.once,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 100),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 100),
      ),
      // bottomScreenMargin: 78,
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() {
    return [
      HomePage(username: username),
      ChatPage(),
      BagPage(),
      ProfilePage(username: username),
    ];
  }
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(
        AppImages.homeNavbarAktif,
      ),
      inactiveIcon: SvgPicture.asset(
        AppImages.homeNavbarInAktif,
      ),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(
        AppImages.messageNavbarAktif,
      ),
      inactiveIcon: SvgPicture.asset(
        AppImages.messageNavbarInAktif,
      ),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(
        AppImages.bagNavbarAktif,
      ),
      inactiveIcon: SvgPicture.asset(
        AppImages.bagNavbarInAktif,
      ),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(
        AppImages.profileNavbarAktif,
      ),
      inactiveIcon: SvgPicture.asset(
        AppImages.profileNavbarInAktif,
      ),
    ),
  ];
}

import 'package:flutter/material.dart';
import 'package:mcontact/routes/routes.dart';
import 'package:mcontact/screens/01_splash_screen/splash_screen.dart';
import 'package:mcontact/screens/02_contact/contact_screen.dart';
import 'package:mcontact/screens/04_favorite/favorite_screen.dart';
import 'package:mcontact/screens/05_profile/my_details_screen.dart';
import 'package:mcontact/themes/colors.dart';
import 'package:mcontact/utils/navigation.dart';
import 'package:mcontact/utils/utils.dart';
import 'package:mcontact/widget/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:mcontact/widget/common/app_bar.dart';
import 'package:mcontact/widget/common/button.dart';

int globalBottmNavIndex = 0;

class BaseLayout extends StatefulWidget {
  final String? title;
  final Widget page;
  final bool showAppBar, showBottomNavBar;
  const BaseLayout({
    super.key,
    this.title,
    required this.page,
    required this.showAppBar,
    required this.showBottomNavBar,
  });

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  List<bool> isActiveList = [true, false, false];

  List<Widget> homePage = [
    const ContactScreen(),
    const FavoriteScreen(),
  ];

  void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void setGlobalBottomNavIndex(int index) {
    if (index == 0) {
      globalBottmNavIndex = 0;
    }
    if (index == 1) {
      gotoScanScreen();
    }
    if (index == 2) {
      globalBottmNavIndex = 1;
    }
  }

  void isBottomNavbarOnTap(int index) {
    setGlobalBottomNavIndex(index);
    for (int i = 0; i < isActiveList.length; i++) {
      if (index == 0) {
        isActiveList[index] = true;
      } else {
        isActiveList[i] = false;
      }
      if (index == 1) {
        isActiveList[index] = true;
      } else {
        isActiveList[i] = false;
      }
      if (index == 2) {
        isActiveList[index] = true;
      } else {
        isActiveList[i] = false;
      }
    }
    setState(() {});
  }

  void gotoScanScreen() {
    Navigation.pushNamed(context, Routes.myDetailsScreen);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        hideKeyboard();
      },
      child: SafeArea(
        top: false,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: widget.showAppBar
              ? PreferredSize(
                  preferredSize: const Size(double.infinity, 60),
                  child: CommonAppBar(
                    title: widget.title.toString(),
                  ),
                )
              : null,
          body: widget.showBottomNavBar
              ? Stack(
                  children: [
                    homePage[globalBottmNavIndex],
                    BottomNavBar(
                      isActive: isActiveList,
                      onTap: isBottomNavbarOnTap,
                    )
                  ],
                )
              : widget.page,
        ),
      ),
    );
  }
}

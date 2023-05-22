import 'package:flutter/material.dart';
import 'package:mcontact/layout/base_layout.dart';
import 'package:mcontact/resources/strings.dart';
import 'package:mcontact/screens/01_splash_screen/splash_screen.dart';
import 'package:mcontact/screens/02_contact/contact_screen.dart';
import 'package:mcontact/screens/02_contact/person_details_screen.dart';
import 'package:mcontact/screens/02_contact/search_screen.dart';
import 'package:mcontact/screens/03_scan/my_qr_code_screen.dart';
import 'package:mcontact/screens/03_scan/scan_screen.dart';
import 'package:mcontact/screens/04_favorite/favorite_screen.dart';
import 'package:mcontact/screens/05_profile/profile_add_or_update_screen.dart';

class Routes {
  static const splashScreen = '/splash-screen';
  static const profileAddOrUpdateScreen = '/profile-add-or-update-screen';
  static const contactScreen = '/contact-screen';
  static const favoriteScreen = '/favorite-screen';
  static const personDetailsScreen = '/person-details-screen';
  static const scanScreen = '/scan-screen';
  static const myQrCodeScreen = '/my-qr-code-screen';
  static const searchScreen = '/search-screen';

  static Map<String, WidgetBuilder> get buildRoutes {
    return {
      splashScreen: (context) => const BaseLayout(
            page: SplashScreen(),
            showAppBar: false,
            showBottomNavBar: false,
          ),
      profileAddOrUpdateScreen: (context) => const BaseLayout(
            page: ProfileAddOrUpdateScreen(),
            showAppBar: false,
            showBottomNavBar: false,
          ),
      contactScreen: (context) => const BaseLayout(
            page: ContactScreen(),
            showAppBar: false,
            showBottomNavBar: true,
          ),
      favoriteScreen: (context) => const BaseLayout(
            page: FavoriteScreen(),
            showAppBar: false,
            showBottomNavBar: true,
          ),
      personDetailsScreen: (context) => const BaseLayout(
            page: PersonDetailsScreen(),
            showAppBar: true,
            showBottomNavBar: false,
            title: Strings.details,
          ),
      scanScreen: (context) => const BaseLayout(
            page: ScanScreen(),
            showAppBar: true,
            showBottomNavBar: false,
            title: Strings.scanQrCode,
          ),
      myQrCodeScreen: (context) => const BaseLayout(
            page: MyQrCodeScreen(),
            showAppBar: true,
            showBottomNavBar: false,
            title: Strings.showMyQr,
          ),
      searchScreen: (context) => const BaseLayout(
            page: SearchScreen(),
            showAppBar: true,
            showBottomNavBar: false,
            title: Strings.search,
          ),
    };
  }

//initial route

  static String get initialRoute => Routes.splashScreen;

//unknown Route
  static Function get unknownRoute {
    return (setting) {
      MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      );
    };
  }
}

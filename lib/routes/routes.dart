import 'package:flutter/material.dart';
import 'package:mcontact/layout/base_layout.dart';
import 'package:mcontact/screens/01_splash_screen/splash_screen.dart';
import 'package:mcontact/screens/02_contact/contact_screen.dart';
import 'package:mcontact/screens/04_favorite/favorite_screen.dart';
import 'package:mcontact/screens/05_profile/my_details_screen.dart';

class Routes {
  static const splashScreen = '/splash-screen';
  static const myDetailsScreen = '/my-details-screen';
  static const contactScreen = '/contact-screen';
  static const favoriteScreen = '/favorite-screen';

  static Map<String, WidgetBuilder> get buildRoutes {
    return {
      splashScreen: (context) => const BaseLayout(
            page: SplashScreen(),
            showAppBar: false,
            showBottomNavBar: false,
          ),
      myDetailsScreen: (context) => const BaseLayout(
            page: MyDetailsScreen(),
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
    };
  }

//initial route

  static String get initialRoute => Routes.contactScreen;

//unknown Route
  static Function get unknownRoute {
    return (setting) {
      MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      );
    };
  }
}

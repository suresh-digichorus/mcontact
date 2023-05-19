import 'package:flutter/material.dart';
import 'package:mcontact/layout/base_layout.dart';
import 'package:mcontact/screens/01_splash_screen/splash_screen.dart';

class Routes {
  static const splashScreen = '/splash-screen';
  static const homeScreen = '/home-screen';

  static Map<String, WidgetBuilder> get buildRoutes {
    return {
      splashScreen: (context) => const BaseLayout(
            page: SplashScreen(),
            showAppBar: false,
            showBottomNavBar: false,
          )
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

import 'package:flutter/material.dart';
import 'package:mcontact/routes/routes.dart';
import 'package:mcontact/themes/themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'uae',
      theme: Themes.themeData(),
      routes: Routes.buildRoutes,
      initialRoute: Routes.initialRoute,
      onUnknownRoute:
          Routes.unknownRoute as Route<dynamic>? Function(RouteSettings),
    );
  }
}

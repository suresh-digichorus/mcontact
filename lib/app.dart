import 'package:flutter/material.dart';
import 'package:mcontact/routes/routes.dart';
import 'package:mcontact/themes/themes.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'M contect',
      theme: Themes.themeData(context),
      routes: Routes.buildRoutes,
      initialRoute: Routes.initialRoute,
      onUnknownRoute:
          Routes.unknownRoute as Route<dynamic>? Function(RouteSettings),
    );
  }
}
